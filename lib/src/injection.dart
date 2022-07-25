import 'package:fluttertemplate/src/presentation/blocs/bottom_bar_bloc/bottom_bar_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() async {
  getIt.registerSingleton<BottomBarCubit>(BottomBarCubit());
  getIt.registerSingleton<HomeCubit>(HomeCubit());
  getIt.registerSingleton<IncompleteCubit>(IncompleteCubit());
  getIt.registerSingleton<CompleteCubit>(CompleteCubit());

}