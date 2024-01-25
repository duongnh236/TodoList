import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final TextEditingController _emilTextEditController = TextEditingController();
  final TextEditingController _workUnitEditController = TextEditingController();

  String selectedValue = "Vietcredit";
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Vietcredit"), value: "Vietcredit"),
      DropdownMenuItem(child: Text("HomeCredit"), value: "HomeCredit"),
      DropdownMenuItem(child: Text("FeCredit"), value: "FeCredit"),
      DropdownMenuItem(child: Text("HDSG"), value: "HDSG"),
    ];
    return menuItems;
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 0.5,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ));
  }

  OutlineInputBorder errorBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
          width: 1,
          color: Colors.red,
        ));
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.arrow_back_outlined),
              ),
              Text(
                S.of(context).workingUnit,
                textAlign: TextAlign.center,
                style: const TextStyle(fontStyle: FontStyle.normal, fontSize: 17),
              ),
              const SizedBox(width: 32)
            ],
          )),
          const Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget _buildTargetCustomer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(S.of(context).customerTarget),
          Text(S.of(context).worker)
        ],
      ),
    );
  }

  Widget _buildTFInput(
      String title, String hintTitle, TextEditingController edt) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      margin: EdgeInsets.only(top: 20.h),
      height: 70.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              controller: edt,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Điền đẩy đủ thông tin';
                }
                return null;
              },
              decoration: InputDecoration(
                  errorStyle: const TextStyle(height: 0, color: Colors.red),
                  hintText: hintTitle,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 20.h),
                  enabledBorder: myinputborder(),
                  focusedBorder: myfocusborder(),
                  errorBorder: errorBorder(),
                  focusedErrorBorder: errorBorder()),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTFDropDown(
      String title, String hintTitle, String selectectedValue) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      margin: EdgeInsets.only(top: 20.h),
      color: Colors.transparent,
      height: 70.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButtonFormField(
                decoration: InputDecoration(
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                    focusedErrorBorder: errorBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 20.h),
                    errorBorder: errorBorder()),
                validator: (value) => value == null ? "Chọn ${title}" : null,
                // value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectectedValue = newValue!;
                  });
                },
                items: dropdownItems),
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      height: 50.h,
      width: 100.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        child: const Center(child: Text("Xác Nhận")),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Thành Công')),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(context),
            _buildTargetCustomer(context),
            _buildTFInput(
                "Email", S.of(context).inputEmail, _emilTextEditController),
            _buildTFInput(S.of(context).nameOfWorkUnit,
                S.of(context).inputNameOfWorkUnit, _workUnitEditController),
            _buildTFDropDown(S.of(context).typeCompany,
                S.of(context).chooseTypeCompany, selectedValue),
            Container(
              height: 10.h,
              margin: EdgeInsets.only(top: 20.h),
              color: Colors.black12,
            ),
            Container(
                margin: EdgeInsets.only(top: 10.h, left: 20.w),
                child: const Text("Thông tin địa chỉ đơn vị công tác",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
            _buildTFDropDown("Tỉnh/ Thành Phố", "Chọn Tỉnh/ Thành Phố", selectedValue),
            _buildTFDropDown("Quận/ Huyện", "Chọn Quận/ Huyện", selectedValue),
            _buildTFDropDown("Phường/ Xã ", "Chọn Phường/ Xã", selectedValue),
            _buildTFDropDown(S.of(context).typeCompany,
                S.of(context).chooseTypeCompany, selectedValue),
            Center(child: _buildButton()),

          ],
        ),
      ),
    );
  }
}
