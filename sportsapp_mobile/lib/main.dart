import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sportsapp_mobile/providers/auth_provider.dart';
import 'package:sportsapp_mobile/screens/profile_screen.dart';
import 'package:sportsapp_mobile/screens/screens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sportsapp_mobile/services/event_service.dart';
import 'package:sportsapp_mobile/services/timer_service.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => EventService()),
        ChangeNotifierProvider(create: (_) => TimerService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  late final FirebaseMessaging _messaging;
  @override
  Widget build(BuildContext context) {
    registerNotification();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sports App',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [Locale('en', ''), Locale('es', '')],
        navigatorKey: navigatorKey,
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'message': (_) => MessageScreen(),
          'calendar': (_) => CalendarScreen(),
          'appointment': (_) => AppointmentScreen(),
          'profile': (_) => ProfileScreen(),
          'integration': (_) => IntegrationScreen(),
          'training': (_) => TrainingScreen()
        },
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.grey[300]));
  }

  void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();

    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      _messaging.getToken().then((token) {
        print('====== FCM  Token =====');
        print(token);

      });
      // For handling the received notifications
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );
        print('===========Message =================');
        print(message.notification?.title);
        print(message.notification?.body);
        print(message.sentTime);
        print(DateTime.now());
        navigatorKey.currentState?.pushNamed('message', arguments: message);
      });
      //FirebaseMessaging.onBackgroundMessage( _backgroundHandler );
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    } else {
      print('User declined or has not accepted permission');
    }
  }
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  print("${message.sentTime}");
  print(DateTime.now());
}

class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}
