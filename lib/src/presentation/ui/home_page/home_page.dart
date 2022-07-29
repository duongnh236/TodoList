import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/injection.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';

import '../../widgets/error_widget_dialog.dart';
import '../../widgets/input_task_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {

  Widget _buildItem(ToDoItemEntity toDoItemEntity, Function(int index) ontap, int index) {
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
        title: const Text("HomePage"),
        actions: <Widget>[
          TextButton(
            key: const Key('TextButton-HomePage'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return InputTaskDialog(tappedSave: (taskName) {
                      context.read<HomeCubit>().createTask(taskName: taskName);
                    }, key: const Key('InputTaskDialog-HomePage'),);
                  });
            },
            child: const Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listenWhen: (previous, current) => current is HomeErrorState,
        listener: (context , state) {
            showDialog(context: context, builder: (BuildContext context) {
              return const ErrorDialog(key: Key('ErrorDialog-HomePage'));
            });
        },
        builder: ( _, state) {
            return Center(
              child: ListView.builder(itemBuilder: (BuildContext context, int index) {
                return _buildItem(state.items![index], (index) {
                  context.read<HomeCubit>().handleTodoList(index: index);
                }, index);
              }, itemCount: state.items != null ?  state.items!.length : 0, key: const Key('ListView-HomePage')),
            );
        },
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}