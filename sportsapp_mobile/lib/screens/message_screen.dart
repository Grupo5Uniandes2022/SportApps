import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RemoteMessage args = ModalRoute.of(context)?.settings.arguments as RemoteMessage;
    PushNotification notification = PushNotification(
      title: args?.notification?.title,
      body: args?.notification?.body,
    );
    final title = notification.title;
    final bodyMessage = notification.body;
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 160,
            ),
            Center(
                child: FaIcon(FontAwesomeIcons.triangleExclamation,
                  size: 50,),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '$title',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '$bodyMessage',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 100,
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'training');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                color: Colors.blueAccent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text('Volver', style: TextStyle(color: Colors.white)),
                ))
          ],
        ),
      ),
    );
  }
}

class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}
