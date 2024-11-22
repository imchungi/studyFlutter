import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pullupfighter/controller/workout_service.dart';
import 'package:pullupfighter/model/workout_model.dart';
import 'package:pullupfighter/providers/workout_provider.dart';

class PullupPage extends StatefulWidget {
  const PullupPage({super.key});

  @override
  State<PullupPage> createState() => _PullupPageState();
}

class _PullupPageState extends State<PullupPage> {
  bool setOnOff = false;
  // Future<void> addAllnew() async {
  //   if (athleticBox.isEmpty) await athleticBox.put('athletic', athletic);
  // }
  //
  // Future<void> allReset() async {
  //   await athleticBox.put('athletic', athletic);
  // }

  List<List<int>> countNumbers = [
    [1],
    [1, 1],
    [1, 1, 1],
    [1, 1, 1, 1],
    [2, 1, 1, 1],
    [2, 2, 1, 1],
    [3, 2, 1, 1],
    [3, 2, 2, 1],
    [3, 3, 2, 1],
    [4, 3, 2, 1],
    [4, 3, 2, 2]
  ];
  final List<int> start = [5, 4, 3, 2, 1];

  void loadData() {
    for (int y = 0; y <= 1000; y++) {
      for (int i = 0; i < start.length; i++) {
        countNumbers.add(List.from(start));
        start[start.length - 1 - i] = start[start.length - i - 1] + 1;
      }
    }
  }

  List<bool> checkSum = [false, false, false, false, false];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  // List<String> workoutList = ['PullUp', 'PushUp', 'Squat'];
  //String _selectedWorkout = 'PullUp';

  @override
  Widget build(BuildContext context) {
    //  final workoutService = context.watch<WorkoutProvider>();
    //WorkoutName _selectedWorkout = WorkoutName.PullUp;
    // void _changeWorkout() {
    //   setState(
    //     () {
    //       int currentIndex = workoutList.indexOf(_selectedWorkout);
    //       _selectedWorkout = workoutList[(currentIndex + 1) % workoutList.length];
    //     },
    //   );
    // }

    return Consumer<WorkoutProvider>(builder: (context, workoutService, snapshot) {
      return SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage('https://picsum.photos/600/800'), // 배경 이미지 URL
            fit: BoxFit.fill,
          )),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // OutlinedButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       '[ AD or Banner ]',
                  //       style: TextStyle(fontSize: 30, color: Colors.white),
                  //     )),
                  //
//                // DropdownButton<WorkoutName>(
                  //   value: _selectedWorkout,
                  //   onChanged: (WorkoutName? newValue) {
                  //     setState(() {
                  //       _selectedWorkout = newValue!;
                  //     });
                  //   },
                  //   items: WorkoutName.values.map((WorkoutName workout) {
                  //     return DropdownMenuItem<WorkoutName>(
                  //       value: workout,
                  //       child: Text(workout.toString().split('.').last),
                  //     );
                  //   }).toList(),
                  // ),

                  SizedBox(height: 20),

                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          final index = workoutService.currentIdx;
                          final countN = countNumbers[index];

                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FloatingActionButton(
                                    onPressed: workoutService.decrementIdx,
                                    tooltip: 'Decrement',
                                    child: Icon(Icons.remove),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Center(
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(index.toString(), style: TextStyle(fontSize: 20)))),
                                  ),
                                  FloatingActionButton(
                                    onPressed: workoutService.incrementIdx,
                                    tooltip: 'Increment',
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  workoutService.changeWorkout();
                                  checkSum = [false, false, false, false, false];
                                },
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: const Color(0xFF8285EE), width: 3),
                                  ),
                                  child: Text(workoutService.selectedWorkout, style: TextStyle(fontSize: 40)),
                                  //Text(index.toString(), style: TextStyle(fontSize: 100)),
                                ),
                              ),
                              //
                              const SizedBox(height: 30),
                              SizedBox(
                                height: 70,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal, // 가로 스크롤 (필요에 따라 변경 가능)
                                  itemCount: countN.length,
                                  itemBuilder: (context, index) {
                                    final e = countN[index];
                                    return SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: checkSum[index] ? Colors.blueGrey : Colors.red,
                                          //shadowColor: Colors.greenAccent,
                                          elevation: 10,
                                          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                          side: const BorderSide(width: 5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            checkSum[index] = !checkSum[index];
                                          });
                                        },
                                        child: Text(
                                          e.toString(),
                                          style: TextStyle(color: Colors.white, fontSize: 18),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.volume_up)),
                  SizedBox(
                    height: 30,
                  ),
                  //
                  _buildSaveButton(context, workoutService),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  //
  Widget _buildSaveButton(BuildContext context, workoutService) {
    return OutlinedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('WorkOut'),
              content: Text('Do U wnat to save a Data?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 팝업창 닫기
                    //
                  },
                  child: Text('Cancle'),
                ),
                TextButton(
                  onPressed: () {
                    WorkOut workouts = WorkOut(
                      title: workoutService.selectedWorkout,
                      memo: 'test',
                      createdAt: DateTime.now(),
                      stepNumber: workoutService.currentIdx,
                      countList: countNumbers[workoutService.currentIdx],
                    );
                    WorkoutService().addWorkout(workouts);
                    Navigator.of(context).pop(); // 팝업창 닫기
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
      child: Text(' S A V E ', style: TextStyle(fontSize: 30, color: Colors.white)),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        side: BorderSide(
          color: Colors.grey,
          width: 3.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
      ),
    );
  }
}

//  // Row(
//                               //     mainAxisAlignment: MainAxisAlignment.center,
//                               //     children:
//                               //
//
//                                   // countN
//                                   //     .map(
//                                   //       (e) => SizedBox(
//                                   //         height: 70,
//                                   //         width: 70,
//                                   //         child: ElevatedButton(
//                                   //             style: ElevatedButton.styleFrom(
//                                   //               backgroundColor: checkSum[e] ? Colors.white : Colors.red,
//                                   //               shadowColor: Colors.greenAccent,
//                                   //               elevation: 10,
//                                   //               textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                                   //               side: BorderSide(width: 5),
//                                   //               shape: RoundedRectangleBorder(
//                                   //                 borderRadius: BorderRadius.circular(20.0),
//                                   //               ),
//                                   //             ),
//                                   //             onPressed: () {
//                                   //               setState(() {
//                                   //                 checkSum[e] = !checkSum[e];
//                                   //                 print(e);
//                                   //
//                                   //                 print(checkSum[e]);
//                                   //               });
//                                   //             },
//                                   //             child: Text(e.toString())),
//                                   //       ),
//                                   //     )
//                                   //     .toList(),       ),
