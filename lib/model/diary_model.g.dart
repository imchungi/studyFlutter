// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkDiaryAdapter extends TypeAdapter<WorkDiary> {
  @override
  final int typeId = 2;

  @override
  WorkDiary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkDiary(
      workDiary: fields[0] as String,
      workTotal: fields[1] as int,
      createdAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WorkDiary obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.workDiary)
      ..writeByte(1)
      ..write(obj.workTotal)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkDiaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
