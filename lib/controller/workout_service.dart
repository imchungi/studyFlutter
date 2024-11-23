import 'package:hive/hive.dart';
import '../model/workout_model.dart';

class WorkoutService {
  final String _boxName = 'workOutBox';

  Future<Box<WorkOut>> get _box async => await Hive.openBox<WorkOut>(_boxName);

  Future<void> addWorkout(WorkOut item) async {
    var box = await _box;
    await box.add(item);
  }

  Future<List<WorkOut>> getAllWorkout() async {
    var box = await _box;
    return box.values.toList();
  }


  Future<List<WorkOut>> getTitleWorkout(String getTitle) async {
    var box = await Hive.openBox<WorkOut>('workoutBox');
    var titleList = box.values.where((e) => e.title == getTitle).toList();
    var recentTitleList = titleList.reversed.take(15).toList();
    return recentTitleList.reversed.toList();
  }


  // Future<List<WorkOut>> getTitleWorkout(getTitle) async {
  //   var box = await _box;
  //   var titleList = box.values.where((e) => e.title == getTitle).toList();
  //   var reList = titleList.reversed.take(30).toList();
  //   var reversedList = reList.reversed.toList();
  //   return reversedList;
  // }//titleList.toList();

  // Future<List<WorkOut>> getTitleReverse(String getTitle) async {
  //   var box = await Hive.openBox<WorkOut>('workoutBox');
  //   var titleList = box.values.where((e) => e.title == getTitle).toList();
  //   var recentTitleList = titleList.reversed.take(30).toList();
  //   return recentTitleList;
  // }

  Future<WorkOut> getLastWorkout(getTitle) async {
    var box = await _box;
    var last = box.values.where((e) => e.title == getTitle).last;
    return last;
  }

  Future<int> getLastCount(getTitle) async {
    print('getlast cout = $getTitle');
    var box = await _box;
    var check = box.values.where((e) => e.title == getTitle);
    if (check.isNotEmpty) {
      int lastbox = await box.values.where((e) => e.title == getTitle).last.stepNumber;
      return lastbox;
    } else {
      //
      if (getTitle == 'Squat') {
        return 36;
      } else if (getTitle == 'PushUp') {
        return 7;
      } else {
        return 0;
      }
      //
    }
  }

  // getLastWorkout<WorkOut>(getTitle) async {
  //   var box = await _box;
  //   var last = box.values.where((e)=> e.title==getTitle ).last;
  //   return last;
  // }

  Future<void> deleteWorkout(DateTime deltime) async {
    var box = await _box;
    var workoutsToDelete = box.values.where((workout) => workout.createdAt == deltime).toList();
    for (var workout in workoutsToDelete) {
      await workout.delete();
    }
  }
// 역순 정렬 때문에 . 날짜 시간으로 삭제 ;
  // Future<void> deleteWorkout(int index) async {
  //   var box = await _box;
  //   await box.deleteAt(index);
  // }

  Future<void> toggleCompleted(int index, WorkOut item) async {
    var box = await _box;
    // item.isCompleted = !item.isCompleted;

    await box.putAt(index, item);
  }
}
