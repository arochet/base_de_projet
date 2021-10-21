import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/presentation/components/spacing.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    //Rafraichit les données utilisateur lors de l'initialisation
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => context.refresh(currentUserData));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      AsyncValue<UserData?> user = watch(currentUserData);
      //Récupère les données utilisateurs (Informations personnelles)
      String nameUser = "";
      String email = "";
      bool isTypeEmail = false;
      user.when(
        data: (data) {
          if (data != null) {
            nameUser = data.userName.getOrCrash();
            email = data.email.getOrCrash();
            isTypeEmail =
                data.typeAccount.getOrCrash() == TypeAccountState.email;
          }
        },
        loading: () {
          nameUser = "...";
          email = "...";
        },
        error: (err, stack) {
          nameUser = "Error";
          email = "Error";
        },
      );

      //Container Informations personnelles
      return ListView(
        children: <Widget>[
          SpaceH20(),
          //TEXTE COMPTE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Text(AppLocalizations.of(context)!.compte,
                style: Theme.of(context).textTheme.headline3),
          ),
          //PANEL
          PanelList(
            list: [
              ItemPanelList(
                title: nameUser,
                icon: Icons.account_circle_rounded,
                onTap: () {},
              ),
              ItemPanelList(
                title: email,
                icon: Icons.mail_rounded,
                onTap: () {},
              ),
            ],
            //Bouton modifier
            button: ElevatedButton(
              onPressed: () {
                context.router.push(ModifyAccountRoute());
              },
              style: buttonPrimaryHide,
              child: Text(AppLocalizations.of(context)!.modifier),
            ),
          ),
          //PANEL
          isTypeEmail
              ? PanelList(list: [
                  //Modifier le mot de passe
                  ItemPanelList(
                    title: AppLocalizations.of(context)!.modifiermotdepasse,
                    icon: Icons.lock,
                    onTap: () {
                      context.router
                          .push(ReauthenticateRoute(route: NewPasswordRoute()));
                    },
                  ),
                  //Supprimer le compte
                  ItemPanelList(
                    title: AppLocalizations.of(context)!.supprimerlecompte,
                    icon: Icons.cancel,
                    onTap: deleteAccount,
                  ),
                ])
              : Container(),
          SpaceH10(),
          //BOUTON SE DECONNECTER
          Align(
            child: ElevatedButton(
              onPressed: () {
                context.read(authNotifierProvider.notifier).signOut();
              },
              style: buttonPrimaryNormal,
              child: Text(AppLocalizations.of(context)!.sedeconnecter),
            ),
          ),
          SpaceH10(),
          Align(child: VersionNumber()),
        ],
      );
    });
  }

  deleteAccount() {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(AppLocalizations.of(context)!.annuler,
          style: Theme.of(context).textTheme.button),
      onPressed: () => context.router.pop(),
    );
    Widget continueButton = TextButton(
      child: Text(AppLocalizations.of(context)!.supprimer,
          style:
              Theme.of(context).textTheme.button?.copyWith(color: Colors.red)),
      onPressed: () async {
        await context.router.pop();
        context.router.push(ReauthenticateRoute(route: DeleteAccountRoute()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(AppLocalizations.of(context)!.attention),
      content: Text(AppLocalizations.of(context)!
          .etesvoussurdevouloursupprimervotrecomte),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class ItemPanelList {
  final IconData icon;
  final String title;
  final Function() onTap;

  ItemPanelList({required this.title, required this.icon, required this.onTap});
}

class PanelList extends StatelessWidget {
  final List<ItemPanelList> list;
  final ElevatedButton? button;
  const PanelList({Key? key, required this.list, this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: Column(children: [
          ...list
              .map((item) => GestureDetector(
                    onTap: item.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(item.icon),
                          SizedBox(width: 10),
                          Text(item.title),
                        ],
                      ),
                    ),
                  ))
              .toList(),
          button ?? Container(),
        ]),
      ),
    );
  }
}

class VersionNumber extends StatefulWidget {
  const VersionNumber({
    Key? key,
  }) : super(key: key);

  @override
  _VersionNumberState createState() => _VersionNumberState();
}

class _VersionNumberState extends State<VersionNumber> {
  String version = "";
  @override
  void initState() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        version = "${packageInfo.version}-${packageInfo.buildNumber}";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("v$version",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.grey)),
    );
  }
}
