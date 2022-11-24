import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sportsapp_mobile/services/event_service.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List<String> items = ['Kinesiologo', 'Entrenador', 'General'];

  String? selectedItem = 'Kinesiologo';
  bool? _value = false;
  int? selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final eventService = Provider.of<EventService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitar Cita'),
      ),
      body: Column(children: [
        SizedBox(height: 40),
        Center(
            child: SizedBox(
          height: 140,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(width: 3, color: Colors.blueAccent))),
            value: selectedItem,
            items: items
                .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: TextStyle(fontSize: 24))))
                .toList(),
            onChanged: (item) => setState(() => {selectedItem = item}),
          ),
        )),
        ListView.builder(
          itemCount: eventService.appointments!.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CheckboxListTile(
                secondary: FaIcon(FontAwesomeIcons.clock),
                title: Text(DateFormat('Hm')
                    .format(eventService.appointments![index].title)
                    .toString()),
                subtitle:
                    Text(eventService.appointments![index].subTitle.toString()),
                value: !eventService.appointments![index].isFree
                    ? !eventService.appointments![index].isFree
                    : eventService.appointments![index].isSelected,
                onChanged: !eventService.appointments![index].isFree
                    ? null
                    : ((value) {
                        print(value);
                      }));
          },
        ),
        SizedBox(
          height: 40,
        ),
        MaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            color: Colors.blueAccent,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text('Solicitar', style: TextStyle(color: Colors.white)),
            ))
      ]),
    );
  }
}
