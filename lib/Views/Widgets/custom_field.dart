import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> onSaved;
  final FormFieldSetter<String> validator;
  final String hintText;
  final Icon icon;
  final TextInputType textInputType;
  CustomField({
    this.textInputType,
    this.hintText,
    this.controller,
    this.icon,
    this.onSaved,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      height: 50,
      width: orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width * 0.87
          : MediaQuery.of(context).size.width * 0.75,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hintText: hintText,
          prefixIcon: icon,
          contentPadding: const EdgeInsets.only(left: 20, top: 10),
        ),
      ),
    );
  }
}
