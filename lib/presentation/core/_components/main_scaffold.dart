import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'main_home_title.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({Key? key, required this.child, this.title}) : super(key: key);
  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (kIsWeb && constraints.maxWidth > 600)
        return Scaffold(
          body: Row(
            children: [
              Container(
                  width: 300,
                  child: Column(
                    children: [
                      MainHomeTitle(),
                      NavLinkRetour(),
                    ],
                  )),
              Expanded(child: child),
            ],
          ),
        );
      else
        return Scaffold(
          appBar: _buildAppBar(context, title),
          body: child,
        );
    });
  }

  AppBar? _buildAppBar(BuildContext context, String? title) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: colorpanel(700),
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: colorpanel(50),
        size: 35,
      ),
      title: title != null ? Text(title, style: Theme.of(context).textTheme.headline4) : null,
      actions: [Icon(Icons.dangerous)],
    );
  }
}

class NavLinkRetour extends StatelessWidget {
  const NavLinkRetour({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
        child: ListTile(
          leading: Icon(Icons.backspace_rounded),
          title: Text(AppLocalizations.of(context)!.retour),
          tileColor: colorpanel(600),
          hoverColor: colorpanel(700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onTap: () => context.router.pop(),
        ));
  }
}
