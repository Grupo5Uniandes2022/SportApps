import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Data {
  final String title;
  String subTitle;
  bool isSelected;
  bool isFree;
  String type;
  Data(
      {required this.isSelected,
      required this.title,
      required this.subTitle,
      required this.isFree,
      required this.type});
}

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List<String> items = ['Kinesiologo', 'Entrenador', 'General'];
  List<Data> _data = [
    Data(
        title: "8AM ",
        subTitle: "free",
        isSelected: false,
        isFree: true,
        type: 'Kinesiologo'),
    Data(
        title: "9AM ",
        subTitle: "busy",
        isSelected: false,
        isFree: false,
        type: 'Kinesiologo'),
    Data(
        title: "10AM ",
        subTitle: "free",
        isSelected: false,
        isFree: true,
        type: 'Kinesiologo'),
    Data(
        title: "11AM ",
        subTitle: "free",
        isSelected: false,
        isFree: true,
        type: 'Kinesiologo'),
    Data(
        title: "12AM ",
        subTitle: "busy",
        isSelected: false,
        isFree: false,
        type: 'Kinesiologo')
  ];

  String? selectedItem = 'Kinesiologo';
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
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
          itemCount: _data.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CheckboxListTile(
                secondary: FaIcon(FontAwesomeIcons.clock),
                title: Text(_data[index].title.toString()),
                subtitle: Text(_data[index].subTitle.toString()),
                value: !_data[index].isFree
                    ? !_data[index].isFree
                    : _data[index].isSelected,
                onChanged: !_data[index].isFree
                    ? null
                    : ((value) {
                        setState(() {
                          if (_data[index].isFree) {
                            for (var i = 0; i < _data.length; i++) {
                              _data[i].isSelected = false;
                            }
                            _data[index].isSelected = value!;
                          }
                        });
                      }));
          },
        ),
        SizedBox(
          height: 40,
        ),
        MaterialButton(
            onPressed: () {
              var pos = -1;
              for (var i = 0; i < _data.length; i++) {
                if (_data[i].isSelected) {
                  pos = i;
                }
                if (pos != -1) {
                  setState(() {
                    _data[pos].isFree = false;
                    _data[pos].subTitle = 'busy';
                    _data[pos].isSelected = false;
                  });
                }
              }
            },
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
