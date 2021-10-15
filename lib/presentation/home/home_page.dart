import 'package:base_de_projet/presentation/account/account_page.dart';
import 'package:base_de_projet/presentation/auth/widget/check_connexion_widget.dart';
import 'package:base_de_projet/presentation/components/is_connected_widget.dart';
import 'package:base_de_projet/presentation/components/show_environment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeArguments {
  final int indexNavigationBar;
  HomeArguments(this.indexNavigationBar);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ShowEnvironment(
      child: IsConnected(
        child: const Center(
          child: Text('Hola !'),
        ),
      ),
    ),
    Center(child: AccountPage()),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as HomeArguments?;
      final index = args != null ? args.indexNavigationBar : 0;
      _onItemTapped(index);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckUserConnected(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.accueil),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context)!.accueil,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: AppLocalizations.of(context)!.compte,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
