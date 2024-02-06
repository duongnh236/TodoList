import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/generated/l10n.dart';
import 'package:fluttertemplate/src/core/router/app_router.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/domain/use_case/home_usecase/home_usercase.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/theme_cubit/theme_dart_cubit.dart';
import 'package:fluttertemplate/src/presentation/ui/home_page/home_page.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_cubit_test.mocks.dart';

class MockHomeUseCase extends Mock implements HomeUseCase {}
@GenerateMocks([MockHomeUseCase])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  late MockMockHomeUseCase mockHomeUseCase;
  setUp(() {
    mockHomeUseCase = MockMockHomeUseCase();

    when(mockHomeUseCase.isHasData()).thenAnswer((_) async => true);
    when(mockHomeUseCase.getTodoItemsLocal())
        .thenAnswer((_) async => [
      TodoIsar(isChecked: true, name: 'aaa'),
      TodoIsar(isChecked: true, name: 'bbb')
    ]);
  });

  Widget createTestWidget() {
    return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, widget) {
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
            BlocProvider(create: (BuildContext context) => ThemeCubit()),
          ],
          child: const MyHomePage(),
        )
    );});
  }

  testWidgets('test HomePage', (tester) async {

    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();
    
    final appBar = find.byKey(const Key('AppBar-HomePage'));
    final listView = find.byKey(const Key('ListView-HomePage'));
    final textButton = find.byKey(const Key('TextButton-HomePage'));

    expect(appBar, findsOneWidget);
    expect(listView, findsWidgets);
    expect(textButton, findsOneWidget);
  });

  testWidgets('should show InputTaskDialog when click TextButton-HomePage', (tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    final textButton = find.byKey(const Key('TextButton-HomePage'));

    await tester.tap(textButton);
    await tester.pumpAndSettle();

    final inputDialog = find.byKey(const Key('InputTaskDialog-HomePage'));
    await tester.pumpAndSettle();

    expect(inputDialog, findsOneWidget);

  });

}