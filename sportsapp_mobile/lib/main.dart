import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sportsapp_mobile/providers/auth_provider.dart';
import 'package:sportsapp_mobile/screens/profile_screen.dart';
import 'package:sportsapp_mobile/screens/screens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(), lazy: false)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'message': (_) => MessageScreen(),
          'calendar': (_) => CalendarScreen(),
          'appointment': (_) => AppointmentScreen(),
          'profile': (_) => ProfileScreen(),
          'integration': (_) => IntegrationScreen()
        },
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.grey[300]));
  }
}
