import 'package:hive/hive.dart';

part 'workout_model.g.dart';

@HiveType(typeId: 3)
class WorkOut extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String memo;
  @HiveField(2)
  DateTime createdAt;
  @HiveField(3)
  int stepNumber;
  @HiveField(4)
  List<int> countList;

  WorkOut(
      {required this.title,
      required this.memo,
      required this.createdAt,
      required this.stepNumber,
      required this.countList});

  @override
  String toString() {
    return 'WorkOut{title: $title, memo: $memo, createdAt: $createdAt, stepNumber: $stepNumber, countList: $countList}';
  }
}
