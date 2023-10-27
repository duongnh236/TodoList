// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:fluttertemplate/generated/l10n.dart';
// import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
// import 'package:fluttertemplate/src/presentation/blocs/bottom_bar_bloc/bottom_bar_cubit.dart';
// import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_cubit.dart';
// import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
// import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_cubit.dart';
// import 'package:fluttertemplate/src/presentation/ui/bottom_bar_page/bottom_bar_page.dart';
// import 'package:mockito/mockito.dart';
// import 'home_cubit_test.mocks.dart';
//
//
// void main() {
//   late MockMockHomeUseCase mockHomeUseCase;
//
//   setUp(() {
//     mockHomeUseCase = MockMockHomeUseCase();
//     when(mockHomeUseCase.isHasData()).thenAnswer((_)  async => true);
//     when(mockHomeUseCase.getTodoItemsLocal()).thenAnswer((_)  async => [ToDoItemEntity(name: 'a', isChecked: true)]);
//   });
//
//   Widget createTestWidget() {
//     return MaterialApp.router(
//         localizationsDelegates: const [
//           S.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: S.delegate.supportedLocales,
//         locale: const Locale('vi'),
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//
//         home: MultiBlocProvider(
//           providers: [
//             BlocProvider(create: (BuildContext context) => BottomBarCubit()),
//             BlocProvider(create: (BuildContext context) => HomeCubit(mockHomeUseCase)),
//             BlocProvider(create: (BuildContext context) => IncompleteCubit()),
//             BlocProvider(create: (BuildContext context) => CompleteCubit()),
//           ],
//           child: const BottomBarPage(),
//         )
//     );
//   }
//
//   testWidgets('test CompletePage', (tester) async {
//
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();
//
//     final bottomNavigationBar = find.byKey(const Key('BottomNavigationBar'));
//     final bottomNavigationBarItemHome = find.byKey(const Key('BottomNavigationBarItem-Home'));
//     final bottomNavigationBarItemComplete = find.byKey(const Key('BottomNavigationBarItem-Complete'));
//     final bottomNavigationBarItemInComplete = find.byKey(const Key('BottomNavigationBarItem-InComplete'));
//
//     expect(bottomNavigationBar, findsOneWidget);
//     expect(bottomNavigationBarItemHome, findsOneWidget);
//     expect(bottomNavigationBarItemComplete, findsOneWidget);
//     expect(bottomNavigationBarItemInComplete, findsOneWidget);
//   });
//
//   testWidgets('Should click BottomNavigationItem navigate to HomePage', (tester) async {
//
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();
//
//     await tester.tap(find.text('Home'));
//     await tester.pump();
//
//     final appBar = find.byKey(const Key('AppBar-HomePage'));
//
//     expect(appBar, findsOneWidget);
//   });
//
//   testWidgets('Should click BottomNavigationItem navigate to InComplete', (tester) async {
//
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();
//
//     await tester.tap(find.text('InComplete'));
//     await tester.pump();
//
//     final appBar = find.byKey(const Key('AppBar-InCompletePage'));
//
//     expect(appBar, findsOneWidget);
//   });
//
//   testWidgets('Should click BottomNavigationItem navigate to CompletePage', (tester) async {
//
//     await tester.pumpWidget(createTestWidget());
//     await tester.pumpAndSettle();
//
//     await tester.tap(find.text('Complete'));
//     await tester.pump();
//
//     final appBar = find.byKey(const Key('AppBar-CompletePage'));
//
//     expect(appBar, findsOneWidget);
//   });
// }