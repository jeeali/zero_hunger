import 'package:flutter/material.dart';
import 'package:zero_hunger/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isObsecure;
  final double topMargin;
  final TextInputType inputType;
  final Size size;
  final bool readOnly;

  const CustomTextField(
      {Key key,
      @required this.hint,
      @required this.controller,
      @required this.isObsecure,
      @required this.inputType,
      @required this.topMargin,
        @required this.size,
        this.readOnly})
      : super(key: key);

  noFunc() {
    debugPrint('No Func');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 1,
      margin: EdgeInsets.only(top: topMargin),
      child: TextField(
        readOnly: readOnly == null ? false : readOnly,
        obscureText: isObsecure,
        controller: controller,
        keyboardType: inputType,
        autofocus: false,
        decoration: InputDecoration(
          labelText: hint,
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(
            ),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        style: TextStyle(
          fontFamily: Styles.font,
          fontWeight: FontWeight.w400,
        ),
        maxLines: 1,
        autocorrect: false,
      ),
    );
  }
}
