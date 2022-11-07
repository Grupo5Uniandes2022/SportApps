import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntegrationScreen extends StatelessWidget {
  const IntegrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool stravaCheck = false;
    bool peakCheck = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Integraciones'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Gestionar integraciones',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                SizedBox(
                  width: 80,
                ),
                FaIcon(FontAwesomeIcons.strava),
                SizedBox(
                  width: 170,
                ),
                Checkbox(value: stravaCheck, onChanged: null)
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 80,
                ),
                Text('Training Peak'),
                SizedBox(
                  width: 105,
                ),
                Checkbox(
                  value: peakCheck,
                  onChanged: null,
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                color: Colors.blueAccent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text('Guardar', style: TextStyle(color: Colors.white)),
                ))
          ],
        ),
      ),
    );
  }
}
