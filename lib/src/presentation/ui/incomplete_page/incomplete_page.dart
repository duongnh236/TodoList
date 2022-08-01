import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_state.dart';
import '../../../domain/entities/todo_item_entity.dart';

class InCompletePage extends StatefulWidget {

  const InCompletePage({Key? key}) : super(key: key);

  @override
  State<InCompletePage> createState() => _InCompletePageState();
}

class _InCompletePageState extends State<InCompletePage> {


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
    final List<ToDoItemEntity> _items = context.read<HomeCubit>().items;
    context.read<IncompleteCubit>().getItems(items: _items);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('AppBar-InCompletePage'),
        title: const Text("InComplete"),
      ),
      body: BlocBuilder<IncompleteCubit, IncompleteState>(builder: ( _, state) {
        if (state is IncompleteInitial ) {
          return Center(
            child: ListView.builder(itemBuilder: (BuildContext context, int index) {
              return _buildItem(state.items![index], (index) {
              }, index);
            }, itemCount: state.items!.length),
            key: const Key('ListView-InCompletePage'),
          );
        } else  {
          return Container();
        }
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
