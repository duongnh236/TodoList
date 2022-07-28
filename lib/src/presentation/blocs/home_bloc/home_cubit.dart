import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/domain/use_case/home_usecase/home_usercase.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';
import '../../../domain/entities/todo_item_entity.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeUserCase) : super(HomeInitialState());

  final HomeUseCase homeUserCase;

  List<ToDoItemEntity> items = [];

  Future<void> getTodoItems() async {
    if (await isHasData()) {
      items = await homeUserCase.getTodoItemsLocal();
    } else {
      items = [];
    }
    emit(HomeHandleStatusItemState(items));
  }
  Future<void> handleTodoList({int? index}) async {
    final _list = List.of(items);
    // items[index ?? 0].isChecked = !items[index ?? 0].isChecked!;
    _list[index ?? 0].isChecked = !_list[index ?? 0].isChecked!;
    final bool isSave = await homeUserCase.saveTodoItemsLocal(items);
    if (isSave) {
      emit(HomeHandleStatusItemState(_list));
    } else {
      emit(HomeErrorState('please try again', items));
    }
  }

  Future<void> createTask({String? taskName}) async {
    final ToDoItemEntity todoTask = ToDoItemEntity(isChecked: false, name: taskName ?? '');
    items.add(todoTask);
    final bool isSave = await homeUserCase.saveTodoItemsLocal(items);
    if (isSave) {
      emit(HomeHandleStatusItemState(items));
    } else {
      emit(HomeErrorState('please try again', items));
    }
  }
  Future<bool> isHasData() async {
    return await homeUserCase.isHasData();
  }
}