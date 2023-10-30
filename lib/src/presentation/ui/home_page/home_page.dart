import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_event.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';
import 'package:go_router/go_router.dart';
import '../../../../generated/l10n.dart';
import '../../../app/router/routes.dart';
import '../../../data/source/local/models/todo_item.dart';
import '../../widgets/error_widget_dialog.dart';
import '../../widgets/input_task_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {



  void _showPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return InputTaskDialog(tappedSave: (taskName) async {
            context.read<HomeCubit>().add(HomeCreateTaskEvent(taskName: taskName));
          }, key: const Key('InputTaskDialog-HomePage'),);
        });
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().getTodoItems();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('AppBar-HomePage'),
        title:  Text(S.of(context).helloWorld('Dương', 'Nguyễn Hải ')),
        actions: <Widget>[
          TextButton(
            key: const Key('TextButton-HomePage'),
            onPressed: () async {
              await S.load(const Locale('en'));
              _showPopup(context);
            },
            child: const Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ],
      ), body: const Column(children: <Widget>[
        // Expanded(child: Test1()),
        ListViewTest()
    ],)
    );
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

  Widget _buildItem(TodoItemHive toDoItemEntity, Function(int index) ontap, int index) {
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
              toDoItemEntity.isChecked ?? false ? Icons.check_box : Icons.check_box_outline_blank_outlined,
              size: 30.0,
              color: toDoItemEntity.isChecked ?? false ?  Colors.blue : Colors.blue,
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
      listener: (context , state) {
        showDialog(context: context, builder: (BuildContext context) {
          return const ErrorDialog(key: Key('ErrorDialog-HomePage'));
        });
      },
      buildWhen: (previous, current) => current is HomeHandleStatusItemState,
      builder: ( context, state) {
        if (state is HomeHandleStatusItemState) {
          return SizedBox(
            height: 300,
            child: ListView.builder(itemBuilder: (BuildContext context, int index) {
              return _buildItem(state.items![index], (index) async {
                 context.read<HomeCubit>().add(HomeToggleStatusEvent(index: index));
              }, index);
            }, itemCount: state.items != null ?  state.items!.length : 0, key: const Key('ListView-HomePage')),
          );
        }
        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeClick1) {
        return InkWell(
            onTap: () {
              // context.read<HomeCubit>().handleCLick(state.isCheck ?? false);
            // }, child: Container(height: 100, width: 40, color: state.isCheck ?? false ? Colors.blue : Colors.green));
            }, child: Container(height: 100, width: 40, color:  Colors.green));
      }
      return Container();
    },buildWhen: (pre,curr) => pre != curr,
      listenWhen: (previous, current) => current is HomeErrorState,
      listener: (context , state) {
        showDialog(context: context, builder: (BuildContext context) {
          return const ErrorDialog(key: Key('ErrorDialog-HomePage'));
        });
        });
  }
}
