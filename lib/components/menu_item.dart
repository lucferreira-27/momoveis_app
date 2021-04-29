import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String nome;
  final IconData icon;
  final Function onPress;
  const MenuItem({this.nome, this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onPress,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 36,
              color: Colors.white,
            ),
            Center(
                child: Text(
              nome,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ))
          ],
        ),
        height: 135,
        width: 323,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(14, 77, 164, 1),
        ),
      ),
    );
  }
}
