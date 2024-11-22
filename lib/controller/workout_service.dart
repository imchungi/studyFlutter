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
      int lastbox = await box.values
          .where((e) => e.title == getTitle)
          .last
          .stepNumber;
      return lastbox;
    } else {
      return 0;
    }

  }

  // getLastWorkout<WorkOut>(getTitle) async {
  //   var box = await _box;
  //   var last = box.values.where((e)=> e.title==getTitle ).last;
  //   return last;
  // }

  Future<void> deleteWorkout(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

  Future<void> toggleCompleted(int index, WorkOut item) async {
    var box = await _box;
    // item.isCompleted = !item.isCompleted;

    await box.putAt(index, item);
  }
}
