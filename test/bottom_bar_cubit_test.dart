import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/src/presentation/blocs/bottom_bar_bloc/bottom_bar_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/bottom_bar_bloc/bottom_bar_state.dart';

void main() {
  late BottomBarCubit bottomBarCubit;
  setUp(() {
    bottomBarCubit = BottomBarCubit();
  });

  tearDown(() {
    bottomBarCubit.close();
  });
  group('test function BottomBarCubit', () {
    test('should initial state equals to BottomBarInit', () async {
      expect(bottomBarCubit.state.runtimeType, BottomBarInit);
    });

    test('should call changeIndex emit state with value', () {
      bottomBarCubit.changeIndex(index: 1);
      expect(bottomBarCubit.indexSelected, 1);
      expect(bottomBarCubit.state.runtimeType, BottomBarIndexState);
    });

    blocTest<BottomBarCubit, BottomBarState>('test BottomBarCubit', build: () {
      return BottomBarCubit();
    }, act: (cubit) => cubit.changeIndex(index: 1), expect: () => [
      isA<BottomBarIndexState>()
    ]);
  });
}