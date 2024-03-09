import 'package:admin/ADMIN_PRESENTATION/core/core/admin_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import '../components/app_loading.dart';

@RoutePage()
class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.router.replaceAll([MainNavigationRoute()]);

    return const Scaffold(body: AppLoading());
  }
}
