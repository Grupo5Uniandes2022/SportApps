import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerService with ChangeNotifier {
  int? seconds;
  int? minutes;
  int? hours;
  String? digitSeconds;
  String? digitMinutes;
  String? digitHours;
  int? distance;
  int? kcal;
  Timer? timer;
  bool? started;
  List? _laps;

  TimerService() {
    seconds = 0;
    minutes = 0;
    hours = 0;
    digitHours = '00';
    digitMinutes = '00';
    digitSeconds = '00';
    distance = 0;
    kcal = 0;
    started = false;
    _laps = [];
  }

  void stop() {
    timer!.cancel();
    started = false;
    notifyListeners();
  }

  void reset() {
    timer!.cancel();
    seconds = 0;
    minutes = 0;
    hours = 0;
    digitHours = '00';
    digitMinutes = '00';
    digitSeconds = '00';
    distance = 0;
    kcal = 0;
    started = false;
    _laps = [];
    notifyListeners();
  }

  List? get laps => _laps;

  void addLaps() {
    String lap = "${digitHours}:${digitMinutes}:${digitSeconds}";
    _laps!.add(lap);
    notifyListeners();
  }

  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int? localSecs = seconds! + 1;
      int? localMinutes = minutes;
      int? localHours = hours;
      if (localSecs > 59) {
        if (localMinutes! > 59) {
          localHours = localHours! + 1;
          localMinutes = 0;
        } else {
          localMinutes = localMinutes + 1;
          localSecs = 0;
        }
      }
      seconds = localSecs;
      minutes = localMinutes;
      hours = localHours;
      digitSeconds = (seconds! >= 10) ? "$seconds" : "0$seconds";
      digitHours = (hours! >= 10) ? "$hours" : "0$hours";
      digitMinutes = (minutes! >= 10) ? "$minutes" : "0$minutes";
      distance = distance! + 7;
      kcal = kcal! + 3;
      notifyListeners();
    });
  }
}
