import 'package:fluttertemplate/src/core/dio_service/dio_service.dart';
import 'package:fluttertemplate/src/data/repositories_impl/home_repository_impl.dart';
import 'package:fluttertemplate/src/data/source/local/hive/hive_datasource.dart';
import 'package:fluttertemplate/src/data/source/remote/home_service.dart';
import 'package:fluttertemplate/src/domain/use_case/home_usecase/home_usercase.dart';
import 'package:fluttertemplate/src/presentation/blocs/bottom_bar_bloc/bottom_bar_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/theme_cubit/theme_dart_cubit.dart';
import 'package:get_it/get_it.dart';
final GetIt getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerSingleton<BottomBarCubit>(BottomBarCubit());

  /// Home
  getIt.registerSingleton<ApiBaseCore>(ApiBaseCore());
  getIt.registerSingleton<HomeService>(HomeService(getIt.get<ApiBaseCore>()));
  getIt.registerSingleton<HiveDataSource>(HiveDataSource());
  getIt.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl(getIt.get<HiveDataSource>(),getIt.get<HomeService>()));
  getIt.registerSingleton<HomeUseCase>(HomeUseCase(getIt.get<HomeRepositoryImpl>()));
  getIt.registerSingleton<HomeCubit>(HomeCubit(getIt.get<HomeUseCase>()));

  //Theme
  getIt.registerSingleton<ThemeCubit>(ThemeCubit());

  // Login
  getIt.registerSingleton<LoginCubit>(LoginCubit());
  /// Incomplete
  getIt.registerSingleton<IncompleteCubit>(IncompleteCubit());

  /// Complete
  getIt.registerSingleton<CompleteCubit>(CompleteCubit());

}
