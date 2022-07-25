import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_state.dart';
import '../../../domain/entities/todo_item_entity.dart';
import '../../blocs/home_bloc/home_cubit.dart';

class CompletePage extends StatefulWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> with AutomaticKeepAliveClientMixin {

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
    final List<ToDoItemEntity> _items = context.read<HomeCubit>().items ?? [];
    context.read<CompleteCubit>().getItems(items: _items);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complete"),
      ),
      body: BlocBuilder<CompleteCubit, CompleteState>(builder: ( _, state) {
        if (state is CompleteInitial ) {
          return Center(
            child: ListView.builder(itemBuilder: (BuildContext context, int index) {
              return _buildItem(state.items![index], (index) {
              }, index);
            }, itemCount: state.items!.length),
          );
        } else  {
          return Container();
        }
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
