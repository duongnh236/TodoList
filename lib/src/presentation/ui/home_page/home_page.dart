import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';
import '../../../../generated/l10n.dart';
import '../../blocs/theme_cubit/theme_dart_cubit.dart';
import '../../widgets/error_widget_dialog.dart';
import '../../widgets/input_task_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {

      bool isVN = false;
  void _showPopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return InputTaskDialog(
            tappedSave: (taskName) async {
              await context.read<HomeCubit>().createTask(taskName: taskName);
            },
            key: const Key('InputTaskDialog-HomePage'),
          );
        });
  }

  Widget _buildChangeLanguage() {
    return Switch(
      // This bool value toggles the switch.
      value: isVN,
      activeColor: Colors.red,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(()  {
            isVN = !isVN;
            S.load(Locale(isVN == true ? 'vi' : 'en'));
        });
      },
    );
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().getTodoItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          key: const Key('AppBar-HomePage'),
          title: Text(S.of(context).helloWorld('Dương', 'Nguyễn Hải ')),
          actions: <Widget>[
            Container(
              color: Colors.red,
              child: TextButton(
                
                key: const Key('TextButton-HomePage'),
                onPressed: () async {
                  _showPopup();
                },
                child: const Icon(Icons.add, color: Colors.white, size: 30),
              ),
            ),
            _buildChangeLanguage()
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 100,
                      child: InkWell(
                          onTap: (() {
                            context.read<ThemeCubit>().changeToDarkTheme();
                          }),
                          child: const Center(child:  Text("Dark to light"))),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 100,
                      child: InkWell(
                          onTap: (() {
                            context.read<ThemeCubit>().changeToLightTheme();
                          }),
                          child:  const Center(child: Text("Light to Dark"))),
                    )
                  ],
                )),

              const SizedBox(height: 50),
              InkWell(
                onTap: () async {
               await context.read<HomeCubit>().testApi();

                },
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.red,
                  child: const Text('TestApi'),
                ),
              ),
             const SizedBox(height: 50),
            const ListViewTest()
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class ListViewTest extends StatefulWidget {
  const ListViewTest({Key? key}) : super(key: key);

  @override
  State<ListViewTest> createState() => _ListViewTestState();
}

class _ListViewTestState extends State<ListViewTest> {
  Widget _buildItem(
      TodoIsar toDoItemEntity, Function(int index) ontap, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 50,
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Text(toDoItemEntity.name ?? '')),
          InkWell(
            onTap: () {
              ontap(index);
            },
            child: Icon(
              toDoItemEntity.isChecked ?? false
                  ? Icons.check_box
                  : Icons.check_box_outline_blank_outlined,
              size: 30.0,
              color:
                  toDoItemEntity.isChecked ?? false ? Colors.blue : Colors.blue,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listenWhen: (previous, current) => current is HomeErrorState,
        listener: (context, state) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ErrorDialog(key: Key('ErrorDialog-HomePage'));
              });
        },
        buildWhen: (previous, current) => previous.items != current.items,
        builder: (context, state) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(state.items![index], (index) async {
                    await context
                        .read<HomeCubit>()
                        .handleTodoList(index: index);
                  }, index);
                },
                itemCount: state.items != null ? state.items!.length : 0,
                key: const Key('ListView-HomePage')),
          );
        }
        );
  }
}

