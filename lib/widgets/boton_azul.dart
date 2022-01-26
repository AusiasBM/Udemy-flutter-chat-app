import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String texto;
  final Function() onPressed;

  const BotonAzul({
    Key? key,
    required this.texto,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: StadiumBorder(),
        elevation: 2,
      ),
      onPressed: this.onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            texto,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
