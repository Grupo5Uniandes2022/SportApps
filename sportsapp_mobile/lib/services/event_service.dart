import 'package:sportsapp_mobile/screens/calendar_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventService with ChangeNotifier {
  List<Meeting>? _meetings;
  List<Appointment>? _appointments;

  EventService() {
    this._meetings = [];
    this._appointments = [
      Appointment(
          title: new DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 08, 0),
          subTitle: "free",
          isSelected: false,
          isFree: true,
          type: 'Kinesiologo'),
      Appointment(
          title: new DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 09, 0),
          subTitle: "busy",
          isSelected: false,
          isFree: false,
          type: 'Kinesiologo'),
      Appointment(
          title: new DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          subTitle: "free",
          isSelected: false,
          isFree: true,
          type: 'Kinesiologo'),
      Appointment(
          title: new DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 11, 0),
          subTitle: "free",
          isSelected: false,
          isFree: true,
          type: 'Kinesiologo'),
      Appointment(
          title: new DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          subTitle: "busy",
          isSelected: false,
          isFree: false,
          type: 'Kinesiologo')
    ];
  }
  MeetingDataSource? get meeting => MeetingDataSource(_meetings!);

  List<Appointment>? get appointments => this._appointments;

  bool get existMeetings => this._meetings != null ? true : false;

  addMeeting(Meeting m) {
    print(m);
    this._meetings?.add(m);
    notifyListeners();
  }

  createAppointment(int index, String type) {
    appointments![index].isFree = false;
    appointments![index].subTitle = 'busy';
    appointments![index].type = type;
    Appointment app = appointments![index];
    Meeting newMeet = Meeting(type, app.title,
        app.title.add(const Duration(hours: 1)), Colors.lightBlue, false);
    this._meetings?.add(newMeet);
    notifyListeners();
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class Appointment {
  final DateTime title;
  String subTitle;
  bool isSelected;
  bool isFree;
  String type;
  Appointment(
      {required this.isSelected,
      required this.title,
      required this.subTitle,
      required this.isFree,
      required this.type});
}
