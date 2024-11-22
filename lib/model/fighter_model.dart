import 'package:hive/hive.dart';
//part 'model.g.dart';

part 'fighter_model.g.dart';

@HiveType(typeId: 0)
class Athletic {
  @HiveField(0)
  int idx;
  @HiveField(1)
  String titleText;
  @HiveField(2)
  String workMemo;
  @HiveField(3)
  List<CountNumber> countList;
  Athletic(this.idx, this.titleText, this.workMemo, this.countList);
}

@HiveType(typeId: 1)
class CountNumber {
  @HiveField(0)
  int countNum;
  @HiveField(1)
  bool isDone = false;
  CountNumber(this.countNum, this.isDone);
}