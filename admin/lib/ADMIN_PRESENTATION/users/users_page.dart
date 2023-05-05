import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: './lib/PRESENTATION/users/users_page.dart',
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(child: Text('USERS')),
      ),
    );
  }
}
