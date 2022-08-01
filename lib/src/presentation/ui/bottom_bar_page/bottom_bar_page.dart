import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/bottom_bar_bloc/bottom_bar_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/bottom_bar_bloc/bottom_bar_state.dart';
import 'package:fluttertemplate/src/presentation/ui/complete_page/complete_page.dart';
import 'package:fluttertemplate/src/presentation/ui/home_page/home_page.dart';
import 'package:fluttertemplate/src/presentation/ui/incomplete_page/incomplete_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}



class _BottomBarPageState extends State<BottomBarPage> {

  Widget _buildBody({int? index}) {
    switch (index) {
      case 0:
        return const MyHomePage();
      case 1:
        return const CompletePage();
      default:
        return const InCompletePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: BlocBuilder<BottomBarCubit, BottomBarState>(
           builder: (_, state) {
         if (state is BottomBarIndexState) {
           return _buildBody(index: state.index ?? 0);
         } else {
           return _buildBody(index: 0);
         }
       }),
      bottomNavigationBar: BottomNavigationBar(
        key: const Key('BottomNavigationBar'),
        type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<BottomBarCubit>().indexSelected ?? 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Container(key: const Key('BottomNavigationBarItem-Home'),), label: "Home"),
          BottomNavigationBarItem(icon: Container(key: const Key('BottomNavigationBarItem-Complete')), label: "Complete"),
          BottomNavigationBarItem(icon: Container(key: const Key('BottomNavigationBarItem-InComplete')), label: "InComplete"),
        ],
        onTap: (int index) {
          context.read<BottomBarCubit>().changeIndex(index: index);
        },
      ),
    );
  }
}
