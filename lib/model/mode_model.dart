import 'package:hive_flutter/hive_flutter.dart';

part 'mode_model.g.dart';
@HiveType(typeId: 4)
class ModeSetting extends HiveObject{
  @HiveField(0)
  late String modeTitle;
  @HiveField(1)
  late int modeStep;
  @HiveField(2)
  late int modeColor;


//<editor-fold desc="Data Methods">


  ModeSetting({
    required this.modeTitle,
    required this.modeStep,
    required this.modeColor,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ModeSetting &&
              runtimeType == other.runtimeType &&
              modeTitle == other.modeTitle &&
              modeStep == other.modeStep &&
              modeColor == other.modeColor
          );


  @override
  int get hashCode =>
      modeTitle.hashCode ^
      modeStep.hashCode ^
      modeColor.hashCode;


  @override
  String toString() {
    return 'ModeSetting{' +
        ' modeTitle: $modeTitle,' +
        ' modeStep: $modeStep,' +
        ' modeColor: $modeColor,' +
        '}';
  }


  ModeSetting copyWith({
    String? modeTitle,
    int? modeStep,
    int? modeColor,
  }) {
    return ModeSetting(
      modeTitle: modeTitle ?? this.modeTitle,
      modeStep: modeStep ?? this.modeStep,
      modeColor: modeColor ?? this.modeColor,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'modeTitle': this.modeTitle,
      'modeStep': this.modeStep,
      'modeColor': this.modeColor,
    };
  }

  factory ModeSetting.fromMap(Map<String, dynamic> map) {
    return ModeSetting(
      modeTitle: map['modeTitle'] as String,
      modeStep: map['modeStep'] as int,
      modeColor: map['modeColor'] as int,
    );
  }


//</editor-fold>
}
