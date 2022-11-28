import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportsapp_mobile/widgets/page_header.dart';
import 'package:sportsapp_mobile/widgets/widgets.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final String url;

  ItemBoton(this.icon, this.texto, this.color1, this.color2, this.url);
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.play, 'Entrenar', Color(0xff317183),
          Color(0xff46997D), 'training'),
      new ItemBoton(FontAwesomeIcons.calendar, 'Calendario', Color(0xff6989F5),
          Color(0xff906EF5), 'calendar'),
      new ItemBoton(FontAwesomeIcons.userDoctor, 'Solicitar Cita',
          Color(0xff66A9F2), Color(0xff536CF6), 'appointment'),
      new ItemBoton(FontAwesomeIcons.personCircleCheck, 'Perfil',
          Color(0xffF2D572), Color(0xffE06AA3), 'profile'),
      new ItemBoton(FontAwesomeIcons.connectdevelop, 'Integraciones',
          Color(0xff317183), Color(0xff46997D), 'integration'),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              child: BotonMenu(
                  icon: item.icon,
                  texto: item.texto,
                  color1: item.color1,
                  color2: item.color2,
                  onPress: () {
                    Navigator.pushNamed(context, item.url);
                  }),
            ))
        .toList();
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 80,
              ),
              ...itemMap
            ],
          ),
        ),
        HomeScreenHeader(),
      ],
    ));
  }
}

class _botonMenuTemp extends StatelessWidget {
  const _botonMenuTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonMenu(
      texto: 'Accidente',
      onPress: () {},
      color1: Color(0xff6989f5),
      color2: Color(0xff906Ef5),
    );
  }
}

class HomeScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconHeader(
        icon: FontAwesomeIcons.dumbbell,
        titulo: 'Sports App',
        subtitulo: 'Bienvenido a ',
        color1: Color(0xff526BF6),
        color2: Color(0xff67ACF2),
      ),
      Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              child: FaIcon(FontAwesomeIcons.ellipsisVertical,
                  color: Colors.white)))
    ]);
  }
}
