import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/core/router/routes.dart';
import 'package:fluttertemplate/src/presentation/blocs/navigation_cubit/navigation_cubit.dart';
import 'package:fluttertemplate/src/presentation/ui/bottom_bar_page/bottom_bar_page.dart';
import 'package:fluttertemplate/src/presentation/ui/complete_page/complete_page.dart';
import 'package:fluttertemplate/src/presentation/ui/home_detail_page/home_detail_page.dart';
import 'package:fluttertemplate/src/presentation/ui/home_page/home_page.dart';
import 'package:fluttertemplate/src/presentation/ui/incomplete_page/incomplete_page.dart';
import 'package:fluttertemplate/src/presentation/ui/login_page/login_page.dart';
import 'package:fluttertemplate/src/presentation/ui/on_boarding_page/on_boarding_page.dart';
import 'package:fluttertemplate/src/presentation/widgets/base_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
      initialLocation: Routes.homePage,
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      routes: [
        // GoRoute(
        //   path: Routes.loginPage,
        //   pageBuilder: (context, state) =>
        //   const NoTransitionPage(child: BaseView(body:LoginPage())),
        // ),
        // GoRoute(
        //   path: Routes.onBoardingPage,
        //   pageBuilder: (context, state) =>
        //   const NoTransitionPage(child: BaseView(body:OnBoardingPage())),
        // )

        // config have bottom bar
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return BlocProvider(
                create: (context) => NavigationCubit(),
                child: BaseView(body:BottomBarPage(screen: child)),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                  path: Routes.homePage,
                  builder: (context, state) =>
                      const  BaseView(body: MyHomePage())),
              GoRoute(
                  path: Routes.homeDetailPage,
                  builder: (context, state) => const BaseView(body:HomeDetailPage())),
              GoRoute(
                  path: Routes.homeDetail1Page,
                  builder: (context, state) => const BaseView(body:HomeDetail1Page())),
              GoRoute(
                path: Routes.inComplete,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: BaseView(body:InCompletePage())),
              ),
              GoRoute(
                path: Routes.complete,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: BaseView(body:CompletePage())),
              ),
              GoRoute(
                path: Routes.loginPage,
                pageBuilder: (context, state) =>
                const NoTransitionPage(child: BaseView(body:LoginPage())),
              )
        
            ])
      ]);

  static GoRouter get router => _router;
}
