import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Campo extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool hide;
  final validatorDefault;
  final Function campoValidator;

  Campo(
      {this.label,
      this.controller,
      this.hide = false,
      this.validatorDefault = true,
      this.campoValidator});

  @override
  Widget build(BuildContext context) {
    Function _campoValidator = campoValidator;
    if (validatorDefault && campoValidator == null) {
      _campoValidator = (value) {
        if (value == null || value.isEmpty) {
          return 'Está vazio!';
        }
        return null;
      };
    }

    return Padding(
        padding: EdgeInsets.only(bottom: 14),
        child: TextFormField(
          validator: _campoValidator,
          obscureText: hide,
          controller: controller,
          style: TextStyle(fontSize: 24.0),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Color.fromARGB(255,38,50,56)),
            labelText: label,
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255,38,50,56), width: 1.0),

            ),
          ),
        ));
  }
}
