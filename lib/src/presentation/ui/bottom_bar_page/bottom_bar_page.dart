import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/theme_cubit/theme_dart_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/routes.dart';
import '../../../core/shared/name_nav_bar_item.dart';
import '../../blocs/navigation_cubit/navigation_cubit.dart';

class BottomBarPage extends StatelessWidget {

  final Widget screen;

  BottomBarPage({Key? key, required this.screen}) : super(key: key);

  BlocBuilder<NavigationCubit, NavigationState> _buildBottomNavigation(mContext, List<NamedNavigationBarItemWidget>tabs) =>
      BlocBuilder<NavigationCubit, NavigationState>(
        buildWhen: (previous, current) => previous.index != current.index,
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (value) {
              if(state.index != value){
                context.read<NavigationCubit>().getNavBarItem(value);
                context.go(tabs[value].initialLocation);
              }
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(
              size: ((IconTheme
                  .of(mContext)
                  .size)! * 1.3),
            ),
            items: tabs,
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
          );
        },
      );

  final tabs = [
    NamedNavigationBarItemWidget(
      initialLocation: Routes.homePage,
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    NamedNavigationBarItemWidget(
      initialLocation: Routes.complete,
      icon: const Icon(Icons.person),
      label: 'Profile',
    ),
    NamedNavigationBarItemWidget(
      initialLocation: Routes.inComplete,
      icon: const Icon(Icons.settings),
      label: 'Setting',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen,
      bottomNavigationBar: _buildBottomNavigation(context, tabs),
    );
  }
}

