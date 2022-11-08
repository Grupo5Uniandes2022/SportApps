import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: FaIcon(FontAwesomeIcons.clock),
            ),
            Tab(
              icon: FaIcon(FontAwesomeIcons.utensils),
            ),
            Tab(
              icon: FaIcon(FontAwesomeIcons.algolia),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          Center(child: FaIcon(FontAwesomeIcons.accusoft)),
          Center(child: FaIcon(FontAwesomeIcons.clock)),
          Center(child: FaIcon(FontAwesomeIcons.alignCenter)),
        ]),
      ),
    );
  }
}
