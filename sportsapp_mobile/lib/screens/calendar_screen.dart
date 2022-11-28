import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsapp_mobile/services/event_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final eventsService = Provider.of<EventService>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calendar', style: TextStyle(fontSize: 45)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async => {await showCreateEventDialog(context)},
          tooltip: 'Add Event',
          child: const Icon(Icons.add),
        ),
        body: Container(
          child: SafeArea(
              child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SfCalendar(
                dataSource: eventsService.meeting,
                monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment,
                    showAgenda: true),
              ),
            ),
          ])),
        ));
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;
    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTimeTemp =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() {
      dateTime = dateTimeTemp;
    });
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2024));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

  Future<void> showCreateEventDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final eventsService = Provider.of<EventService>(context);
          final TextEditingController _textEditingController =
              TextEditingController();
          return StatefulBuilder(
            builder: ((context, setState) {
              return AlertDialog(
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Crear evento',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isEmpty ? 'Campo invalido' : null;
                        },
                        decoration:
                            InputDecoration(hintText: 'Titulo actividad'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(children: [
                        Text(dateTime.toString()),
                        MaterialButton(
                          onPressed: () async {
                            await pickDateTime();
                            setState(() {
                              this.dateTime = dateTime;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Escoger fecha',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          color: Colors.blue,
                        ),
                      ])
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          eventsService.addMeeting(Meeting(
                              _textEditingController.text,
                              dateTime,
                              dateTime.add(const Duration(hours: 1)),
                              Colors.lightGreen,
                              false));
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Crear'))
                ],
              );
            }),
          );
        });
  }
}
