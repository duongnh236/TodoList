import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_cubit.dart';
import 'package:fluttertemplate/src/presentation/ui/complete_page/complete_page.dart';
import 'package:fluttertemplate/src/presentation/ui/incomplete_page/incomplete_page.dart';

import 'home_cubit_test.mocks.dart';



void main() {
  late MockMockHomeUseCase mockHomeUseCase;

  setUp(() {
    mockHomeUseCase = MockMockHomeUseCase();
  });

  Widget createTestWidget() {
    return MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) => HomeCubit(mockHomeUseCase)),
            BlocProvider(create: (BuildContext context) => IncompleteCubit()),
          ],
          child: const InCompletePage(),
        )
    );
  }

  testWidgets('test InCompletePage', (tester) async {

    await tester.pumpWidget(createTestWidget());

    final appBar = find.byKey(const Key('AppBar-InCompletePage'));
    final listView = find.byKey(const Key('ListView-InCompletePage'));

    expect(appBar, findsOneWidget);
    expect(listView, findsOneWidget);
  });
}