import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/injection.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';

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
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: ( _, state) {
        if (state is HomeHandleStatusItemState ) {
          return Center(
            child: ListView.builder(itemBuilder: (BuildContext context, int index) {
              return _buildItem(state.items![index], (index) {
                print(index);
                context.read<HomeCubit>().handleTodoList(index: index);
              }, index);
            }, itemCount: state.items!.length),
          );
        } else  {
          return Container();
        }
      }, bloc: getIt.get<HomeCubit>()), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}