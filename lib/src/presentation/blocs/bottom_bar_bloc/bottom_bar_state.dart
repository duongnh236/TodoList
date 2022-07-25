import 'package:equatable/equatable.dart';

abstract class BottomBarState extends Equatable {}
class BottomBarInit extends BottomBarState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BottomBarIndexState extends BottomBarState {

  final int? index;

  BottomBarIndexState({this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [index];

}