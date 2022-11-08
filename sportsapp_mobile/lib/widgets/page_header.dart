import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader(
      {required this.icon,
      required this.titulo,
      required this.subtitulo,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    final Color colBlanco = Colors.white.withOpacity(0.7);
    return Stack(children: <Widget>[
      _IconHeaderBackground(color1: this.color1, color2: this.color2),
      Positioned(
          top: -50,
          left: -20,
          child: FaIcon(this.icon,
              size: 250, color: Colors.white.withOpacity(0.2))),
      Column(
        children: [
          SizedBox(
            height: 80,
            width: double.infinity,
          ),
          Text(this.subtitulo,
              style: TextStyle(fontSize: 20, color: colBlanco)),
          SizedBox(
            height: 20,
          ),
          Text(this.titulo,
              style: TextStyle(
                  fontSize: 25, color: colBlanco, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          FaIcon(this.icon, size: 80, color: Colors.white)
        ],
      )
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _IconHeaderBackground({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[this.color1, this.color2])),
    );
  }
}
