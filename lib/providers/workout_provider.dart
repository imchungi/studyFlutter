import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pullupfighter/model/mode_model.dart';

import '../controller/workout_service.dart';
import '../model/workout_model.dart';

class WorkoutProvider extends ChangeNotifier {
  int _currentIdx = 0;
  int get currentIdx => _currentIdx;

  List<String> workoutList = ['PullUp', 'PushUp', 'Squat'];
  String _selectedWorkout = 'PullUp';
  String get selectedWorkout => _selectedWorkout;

  //settings
  // final String _boxName = 'modeBox';
  // Future<Box<ModeSetting>> get _modebox async => await Hive.openBox<ModeSetting>(_boxName);

  WorkoutProvider() {
    init();
    //초기화 해줄때 . 생성자는 동기화 안되니 따로 만들고 데이터는  notifyListeners(); 해줘야 한다.
    //매처음 기본값 으로 빌드된다음 . 로딩되는 대로 init()으로 변환이 된다.
  }
    //
  Future<void> init() async {
    //settings
    // var box = await _modebox;
    // workoutList = box.values.map((e) => e.modeTitle).toList();

    print('workoutlist = $workoutList');
    WorkOut test = await WorkoutService().getLastWorkout('PullUp');
    if (test.isInBox) {
      _currentIdx = test.stepNumber.toInt();
      _selectedWorkout = test.title;
    } else {
      _currentIdx = 0;
      _selectedWorkout = 'PullUp';
       }
    notifyListeners();
  }

  Future<void> changeWorkout() async {
    int currentIndex = workoutList.indexOf(_selectedWorkout);
    _selectedWorkout = workoutList[(currentIndex + 1) % workoutList.length];

    int lastCount = await WorkoutService().getLastCount(_selectedWorkout);

    _currentIdx = lastCount;
    notifyListeners();
  }

  //WorkoutProvider().setCurrentIdx(test.stepNumber.toInt());
  void setCurrentIdx(num) {
    _currentIdx = num;
    notifyListeners();
  }

  void incrementIdx() {
    _currentIdx++;
    notifyListeners();
  }

  void decrementIdx() {
    if (_currentIdx > 0) {
      _currentIdx--;
    }
    notifyListeners();
  }
}
