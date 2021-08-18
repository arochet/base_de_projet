import 'package:base_de_projet/presentation/account/widget/modify_account_form.dart';
import 'package:flutter/material.dart';

class ModifyAccountPage extends StatefulWidget {
  const ModifyAccountPage({Key? key}) : super(key: key);

  @override
  _ModifyAccountPageState createState() => _ModifyAccountPageState();
}

class _ModifyAccountPageState extends State<ModifyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 65,
        ),
      ),
      body: Column(children: <Widget>[
        FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
                  child: Text(
                    "Modifier Profil",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                SizedBox(height: 14)
              ],
            ),
          ),
        ),
        Expanded(child: ModifyAccountForm()),
      ]),
    );
  }
}
