import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertemplate/src/core/router/routes.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _userTextEditController = TextEditingController();
  final TextEditingController _passTextEditController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.redAccent,
          width: 3,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.greenAccent,
          width: 3,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.only(left: 25, right: 20),
                margin: const EdgeInsets.fromLTRB(20,10,20,10),
                child: TextFormField(
                  controller: _userTextEditController,
                  decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: const Icon(Icons.people),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder()
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.only(left: 25, right: 20),
                margin: const EdgeInsets.fromLTRB(20,10,20,10),
                child: TextFormField(
                  controller: _passTextEditController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration:  InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: "Password",
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder()
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.h),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.h),
            color: Colors.green,
          ),
          height: 50.h,
          width: 200.w,
          child: ElevatedButton(
            onPressed: () {
              if (_passTextEditController.text.isEmpty || _userTextEditController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Vui lòng điền đầy đủ thông tin')),
                );
              } else {
                context.go(Routes.onBoardingPage);
              }
            },
            child: const Center(child: Text("Đăng Nhập ", style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20.0),)),
          ),
        )
      ]),
    );
  }
}
