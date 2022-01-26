import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String textoPregunta;
  final String textoNegrita;

  const Labels(
      {Key? key,
      required this.ruta,
      required this.textoPregunta,
      required this.textoNegrita})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            textoPregunta,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
            child: Text(
              textoNegrita,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
