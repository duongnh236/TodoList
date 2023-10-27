import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertemplate/src/app/router/app_router.dart';
import 'package:fluttertemplate/src/core/utils/local_database_util.dart';
import 'package:fluttertemplate/src/injection.dart';
import 'package:fluttertemplate/src/presentation/blocs/bottom_bar_bloc/bottom_bar_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_cubit.dart';
import 'package:fluttertemplate/src/presentation/ui/bottom_bar_page/bottom_bar_page.dart';
import 'generated/l10n.dart';

Future<void> main()  async {

  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  // await getIt.get<LocalDataSource>().initialize();
  await DatabaseUtil.initDatabase();
  runApp(const MyApp());
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
        BlocProvider(create: (BuildContext context) => getIt.get<CompleteCubit>())
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
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            );
          }),
    );
  }
}


