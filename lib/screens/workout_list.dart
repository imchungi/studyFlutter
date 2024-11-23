import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pullupfighter/controller/workout_service.dart';
import 'package:pullupfighter/model/workout_model.dart';
import 'package:intl/intl.dart';

class WorkoutList extends StatefulWidget {
  const WorkoutList({super.key});

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  final DateFormat formatDate  = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/600/800'), // 배경 이미지 URL
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        body: ValueListenableBuilder(
            valueListenable: Hive.box<WorkOut>('workoutBox').listenable(),
            builder: (context, Box<WorkOut> box, _) {
              //역순정렬
              final reversedWorkouts = box.values.toList().reversed;
              return ListView.builder(
                  itemCount:  reversedWorkouts.length, //box.values.length,
                  itemBuilder: (context, index) {
                    final workoutlist = reversedWorkouts.elementAt(index);
                    //var workoutlist = box.getAt(index);

                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            // Image
                            Text(workoutlist!.title.toString()),
                            const SizedBox(width: 16),
                            // Item details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: workoutlist.countList.map((count) => Text(' $count ')).toList(),
                                  ),
                                  Text(
                                  formatDate.format(workoutlist.createdAt),
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Quantity controls
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () {},
                                ),
                                Text(
                                  '',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => WorkoutService().deleteWorkout(workoutlist!.createdAt),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

//Row(
//                         children: [
//                           Column(
//                             children: [
//                               Text(workoutlist!.title.toString()),
//                               Text(workoutlist!.createdAt.toString()),
//                               Row(
//                                 children: workoutlist.countList.map((count) => Text('[$count]')).toList(),
//                               ),
//                             ],
//                           ),
//                           IconButton(
//                               onPressed: () {
//                                 WorkoutService().deleteWorkout(index);
//                               },
//                               icon: Icon(Icons.delete)),
//                         ],
//                       ),
