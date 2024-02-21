import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertemplate/src/core/router/app_router.dart';
import 'package:fluttertemplate/src/core/utils/local_database_util.dart';
import 'package:fluttertemplate/src/injection.dart';
import 'package:fluttertemplate/src/presentation/blocs/bottom_bar_bloc/bottom_bar_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/theme_cubit/theme_dart_cubit.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'generated/l10n.dart';

Future<void> main()  async {


  runZonedGuarded(() async {
    await SentryFlutter.init((option) async {
      //'https://e85b375ffb9f43cf8bdf9787768149e0@o447951.ingest.sentry.io/5428562'
      option.dsn = 'https://afdebdd102f28947642b71c3cb21b3c5@o4506771210240000.ingest.sentry.io/4506771216531456';
      option.tracesSampleRate = 1.0;
          WidgetsFlutterBinding.ensureInitialized();
      await setup();
      // await getIt.get<LocalDataSource>().initialize();
      await DatabaseUtil.initDatabase();

    }, appRunner: () => runApp(const MyApp()));

  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
   });


  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => getIt.get<BottomBarCubit>()),
        BlocProvider(create: (BuildContext context) => getIt.get<HomeCubit>()),
        BlocProvider(create: (BuildContext context) => getIt.get<IncompleteCubit>()),
        BlocProvider(create: (BuildContext context) => getIt.get<CompleteCubit>()),
        BlocProvider(create: (BuildContext context) => getIt.get<LoginCubit>()),
        BlocProvider(create: (BuildContext context) => getIt.get<ThemeCubit>())
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, widget) {
            return MaterialApp.router(
              // routerConfig: AppRouter.router,
              routerDelegate: AppRouter.router.routerDelegate,
              routeInformationProvider: AppRouter.router.routeInformationProvider,
              routeInformationParser: AppRouter.router.routeInformationParser,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: const Locale('vi'),
              // theme: ThemeData(
              //   primarySwatch: Colors.blue,
              // ),
            );
          }),
    );
  }
}


