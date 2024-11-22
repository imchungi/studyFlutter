// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkOutAdapter extends TypeAdapter<WorkOut> {
  @override
  final int typeId = 3;

  @override
  WorkOut read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkOut(
      title: fields[0] as String,
      memo: fields[1] as String,
      createdAt: fields[2] as DateTime,
      stepNumber: fields[3] as int,
      countList: (fields[4] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkOut obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.memo)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.stepNumber)
      ..writeByte(4)
      ..write(obj.countList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkOutAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
