import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sportsapp_mobile/services/event_service.dart';
import 'package:sportsapp_mobile/services/timer_service.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timerService = Provider.of<TimerService>(context);
    final hours = timerService.digitHours;
    final minutes = timerService.digitMinutes;
    final seconds = timerService.digitSeconds;
    final distance = timerService.distance;
    final kcal = timerService.kcal;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Entrenando ...',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text('${hours}:${minutes}:${seconds}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 82.0,
                      fontWeight: FontWeight.w600)),
            ),
            Center(
              child: Text('${distance}m ${kcal} j',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w100)),
            ),
            Container(
              height: 400.0,
              decoration: BoxDecoration(
                  color: Color(0xFF323F68),
                  borderRadius: BorderRadius.circular(8.0)),
              child: ListView.builder(
                  itemCount: timerService.laps!.length,
                  itemBuilder: (context, index) {
                    final laps = Provider.of<TimerService>(context).laps;
                    return Padding(
                        padding: const EdgeInsets.all(16.6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Lap # ${index}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                            Text(
                              '${laps![index]}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ],
                        ));
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RawMaterialButton(
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue)),
                    onPressed: () {
                      timerService.start();
                    },
                    child: Text("Start", style: TextStyle(color: Colors.black)),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      timerService.addLaps();
                    },
                    icon: Icon(Icons.flag)),
                Expanded(
                  child: RawMaterialButton(
                    fillColor: Colors.blue,
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue)),
                    onPressed: () {
                      timerService.reset();
                    },
                    child: Text("Reset", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
