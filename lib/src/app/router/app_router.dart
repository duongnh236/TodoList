import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/app/router/routes.dart';
import 'package:fluttertemplate/src/presentation/blocs/navigation_cubit/navigation_cubit.dart';
import 'package:fluttertemplate/src/presentation/ui/bottom_bar_page/bottom_bar_page.dart';
import 'package:fluttertemplate/src/presentation/ui/complete_page/complete_page.dart';
import 'package:fluttertemplate/src/presentation/ui/home_detail_page/home_detail_page.dart';
import 'package:fluttertemplate/src/presentation/ui/home_page/home_page.dart';
import 'package:fluttertemplate/src/presentation/ui/incomplete_page/incomplete_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
      initialLocation: Routes.homePage,
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return BlocProvider(
                create: (context) => NavigationCubit(),
                child: BottomBarPage(screen: child),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                  path: Routes.homePage,
                  builder: (context, state) =>
                      const  MyHomePage()),
              GoRoute(
                  path: Routes.homeDetailPage,
                  builder: (context, state) => const HomeDetailPage()),
              GoRoute(
                  path: Routes.homeDetail1Page,
                  builder: (context, state) => const HomeDetail1Page()),
              GoRoute(
                path: Routes.inComplete,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: InCompletePage()),
              ),
              GoRoute(
                path: Routes.complete,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: CompletePage()),
              ),

            ])
      ]);

  static GoRouter get router => _router;
}
