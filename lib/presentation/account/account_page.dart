import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/presentation/account/widget/card_show_info.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      return user.when(
        data: (data) {
          String nameUser = "";
          String email = "";
          if (data != null) {
            nameUser = data.userName.getOrCrash();
            email = data.email.getOrCrash();
          }

          //Container Informations personnelles
          return ListView(
            children: <Widget>[
              SizedBox(height: 40),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: Text("Informations Personnelles",
                    style: Theme.of(context).textTheme.headline5),
              ),
              CardShowInfo(title: "Nom d'utilisateur", body: nameUser),
              CardShowInfo(title: "Adresse Email", body: email),
              SizedBox(height: 10),
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.modifyAccount);
                  },
                  style: buttonPrimaryNormal,
                  child: const Text('Modifier'),
                ),
              ),
            ],
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => Text("Error : $err"),
      );
    });
  }
}
