import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/router/routes.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(bottomNavItems: Routes.homePage, index: 0));

  void getNavBarItem(int index) {
    switch (index) {
      case 0:
        emit(const NavigationState(bottomNavItems: Routes.homePage,index:  0));
        break;
      case 1:
        emit(const NavigationState(bottomNavItems: Routes.homePage,index:  1));
        break;
      case 2:
        emit(const NavigationState(bottomNavItems: Routes.homePage,index:  2));
        break;
    }
  }
}
