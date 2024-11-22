import 'package:hive/hive.dart';

part 'diary_model.g.dart';

// list 저장하는게 낮지 않나 ? .. 딸랑 토탈은 좀 ;
@HiveType(typeId: 2)
class WorkDiary extends HiveObject{
  @HiveField(0)
  late String workDiary;
  @HiveField(1)
  late int workTotal;
  @HiveField(2)
  late DateTime createdAt;

  WorkDiary({required this.workDiary,required this.workTotal, required this.createdAt});
}
