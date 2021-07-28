import 'package:auto_route/annotations.dart';
import 'package:base_de_projet/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:base_de_projet/presentation/sign_in/sign_in.dart';
import 'package:base_de_projet/presentation/splash/splash_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: NotesOverviewPage),
])
class $AppRouter {}
