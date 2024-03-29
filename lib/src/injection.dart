import 'package:fluttertemplate/src/data/repositories_impl/home_repository_impl.dart';
import 'package:fluttertemplate/src/domain/use_case/home_usecase/home_usercase.dart';
import 'package:fluttertemplate/src/presentation/blocs/bottom_bar_bloc/bottom_bar_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/source/local/local_datasource.dart';

final GetIt getIt = GetIt.instance;
Future<void> setup() async {
  getIt.registerSingleton<BottomBarCubit>(BottomBarCubit());

  /// Home

  getIt.registerSingleton<LocalDataSource>(LocalDataSource());
  getIt.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl(getIt.get<LocalDataSource>()));
  getIt.registerSingleton<HomeUseCase>(HomeUseCase(getIt.get<HomeRepositoryImpl>()));
  getIt.registerSingleton<HomeCubit>(HomeCubit(getIt.get<HomeUseCase>()));

  /// Incomplete
  getIt.registerSingleton<IncompleteCubit>(IncompleteCubit());

  /// Complete
  getIt.registerSingleton<CompleteCubit>(CompleteCubit());

}
