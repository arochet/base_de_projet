import 'package:admin/ADMIN_PRESENTATION/core/_components/app_async.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_components/display_db_table.dart';
import 'package:admin/providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/DOMAIN/auth/user_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:admin/ADMIN_PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class UsersPage extends ConsumerWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamListUser = ref.watch(listUsersFormNotifierProvider);

    return ShowComponentFile(
        title: './lib/PRESENTATION/users/users_page.dart',
        child: Padding(
            padding: EdgeInsets.all(10),
            child: AppAsync(streamListUser, builder: (Option<List<UserData>>? optionListUserData) {
              return optionListUserData!.fold(() => Container(), (List<UserData> listUser) {
                return DisplayDBTable(
                    title: UserData.title,
                    rowLength: listUser.length,
                    cell: ((column, row) {
                      return listUser[row].fieldToString(column);
                    }));
              });
            })));
  }
}
