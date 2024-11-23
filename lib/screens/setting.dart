import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pullupfighter/model/mode_model.dart';

import '../controller/workout_service.dart';
import '../model/workout_model.dart';
import '../widget/work_chart.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final String _boxName = 'modeBox';

  Future<Box<WorkOut>> get _box async => await Hive.openBox<WorkOut>(_boxName);

  Future<void> addWorkout(WorkOut item) async {
    var box = await _box;
    await box.add(item);
  }

  Future<List<WorkOut>> getAllWorkout() async {
    var box = await _box;
    return box.values.toList();
  }

  // ModeSetting? modeSetting;
  Box? _modeBox;

  Future<void> _fetchMode() async {
    _modeBox = await Hive.openBox<ModeSetting>('modeBox');
    if (_modeBox!.isEmpty) {
      _modeBox!.addAll(
        <ModeSetting>[
          ModeSetting(modeTitle: 'PullUp', modeStep: 5, modeColor: 0xFF00FF00),
          ModeSetting(modeTitle: 'PushUp', modeStep: 6, modeColor: 0xFF00FF00),
          ModeSetting(modeTitle: 'Squat', modeStep: 200, modeColor: 0xFF00FF00),
        ],
      );
    }
  }

  List<WorkOut> a = [];

  @override
  void initState() {
    _fetchMode();
    super.initState();
  }

  // Future<Box<WorkOut>> getWorkOut() async {
  //   var workOut = await Hive.openBox<WorkOut>('workOutBox');
  //   return workOut;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<WorkOut>>(
                // 최근 30개, 해당 종목에 해당하는 ? 교체?  getTitleWorkout(getTitle) getAllWorkout(),
                future: WorkoutService().getTitleWorkout('Squat'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    List<WorkOut> workouts = snapshot!.data!;
                    List<StepPoint> stepPoints = [];
                    for (int i = 0; i < snapshot!.data!.length; i++) {
                      var doubleY = workouts[i].countList.reduce((a, b) => a + b);
                      stepPoints.add(StepPoint(x: i.toDouble(), y: doubleY.toDouble()));
                      //stepNumber.toDouble()));
                      print('$i, ${doubleY}');
                    }
                    return PullupChart(workoutData: stepPoints);
                  }
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<WorkOut>>(
                // 최근 30개, 해당 종목에 해당하는 ? 교체?  getTitleWorkout(getTitle) getAllWorkout(),
                future: WorkoutService().getTitleWorkout('PullUp'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    List<WorkOut> workouts = snapshot!.data!;
                    List<StepPoint> stepPoints = [];
                    for (int i = 0; i < snapshot!.data!.length; i++) {
                      var doubleY = workouts[i].countList.reduce((a, b) => a + b);
                      stepPoints.add(StepPoint(x: i.toDouble(), y: doubleY.toDouble()));
                      //stepNumber.toDouble()));
                      print('$i, ${doubleY}');
                    }
                    return PullupChart(workoutData: stepPoints);
                  }
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<WorkOut>>(
                // 최근 30개, 해당 종목에 해당하는 ? 교체?  getTitleWorkout(getTitle) getAllWorkout(),
                future: WorkoutService().getTitleWorkout('PushUp'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    List<WorkOut> workouts = snapshot!.data!;
                    List<StepPoint> stepPoints = [];
                    for (int i = 0; i < snapshot!.data!.length; i++) {
                      var doubleY = workouts[i].countList.reduce((a, b) => a + b);
                      stepPoints.add(StepPoint(x: i.toDouble(), y: doubleY.toDouble()));
                      //stepNumber.toDouble()));
                      print('$i, ${doubleY}');
                    }
                    return PullupChart(workoutData: stepPoints);
                  }
                },
              ),
            ),
            Text('Athletic List'),
            // Expanded(
            //   child: ValueListenableBuilder(
            //     valueListenable: Hive.box<ModeSetting>('modeBox').listenable(),
            //     builder: (context, Box<ModeSetting> box, _) {
            //       return ListView.builder(
            //         itemCount: box.values.length,
            //         itemBuilder: (context, index) {
            //           final modelist = box.getAt(index);
            //           return Card(
            //             child: ListTile(
            //               title: Text(modelist!.modeTitle),
            //               subtitle: Text('Step: ${modelist.modeStep}, Color: ${modelist.modeColor}'),
            //               trailing: IconButton(
            //                   onPressed: () {
            //                     modelist.delete();
            //                   },
            //                   icon: Icon(Icons.delete)),
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class StepPoint {
  final double x;
  final double y;

  StepPoint({required this.x, required this.y});
}
