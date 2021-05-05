import 'package:flutter/material.dart';

class CampoFormulario extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool hide;
  final validatorDefault;
  final Function campoValidator;

  CampoFormulario(
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
          return 'Campo não pode estar vazio!';
        }
        return null;
      };
    }

    return Padding(
        padding: EdgeInsets.only(bottom: 14),
        child: Container(
            width: 350.0,
            color: Colors.white,
            child: TextFormField(
              validator: _campoValidator,
              obscureText: hide,
              controller: controller,
              style: TextStyle(fontSize: 18.0),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5.0),
                labelText: label,
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[900]),
                ),
              ),
            )));
  }
}
