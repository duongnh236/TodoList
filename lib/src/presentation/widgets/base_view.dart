import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/theme_cubit/theme_dart_cubit.dart';
import 'package:fluttertemplate/src/presentation/blocs/theme_cubit/theme_dart_state.dart';

import '../../core/theme/theme_colors.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key, this.body}) : super(key: key);
  final Widget? body;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (value) {

        },
        child: BlocBuilder<ThemeCubit, ChangeThemeState>(
          builder: (context, themeState) {
            return Scaffold(
                backgroundColor: themeState.customColors[AppColors.white],
                body: SafeArea(
                  child: Container(
                    child: widget.body,
                  ),
                ));
          },
        ));
  }
}
