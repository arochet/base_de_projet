import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/domain/auth/user_auth.dart';
import 'package:base_de_projet/presentation/account/account_page.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text('Hola !'),
    ),
    Center(child: AccountPage()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: authNotifierProvider,
      onChange: (context, AuthState myAuthState) {
        if (!(myAuthState is AuthAuthenticated)) {
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacementNamed(context, AppRouter.authInit);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: IconButton(
            onPressed: () {
              context.read(authNotifierProvider.notifier).signOut();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Compte',
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

/* class DispCurrentUser extends ConsumerWidget {
  const DispCurrentUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<UserAuth> user = watch(currentUser);

    return user.when(
      data: (u) => Text("Current User : ${u.id.getOrCrash()}"),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text("Error : $err"),
    );
  }
}
 */