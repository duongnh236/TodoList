import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/generated/l10n.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_cubit.dart';
import 'package:fluttertemplate/src/presentation/ui/incomplete_page/incomplete_page.dart';
import 'home_cubit_test.mocks.dart';

void main() {
  late MockMockHomeUseCase mockHomeUseCase;

  setUp(() {
    mockHomeUseCase = MockMockHomeUseCase();
  });

  Widget createTestWidget() {
    return MaterialApp(
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
    await tester.pumpAndSettle();

    final appBar = find.byKey(const Key('AppBar-InCompletePage'));
    final listView = find.byKey(const Key('ListView-InCompletePage'));

    expect(appBar, findsOneWidget);
    expect(listView, findsOneWidget);
  });
}