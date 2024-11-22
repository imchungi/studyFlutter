// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fighter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AthleticAdapter extends TypeAdapter<Athletic> {
  @override
  final int typeId = 0;

  @override
  Athletic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Athletic(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      (fields[3] as List).cast<CountNumber>(),
    );
  }

  @override
  void write(BinaryWriter writer, Athletic obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.idx)
      ..writeByte(1)
      ..write(obj.titleText)
      ..writeByte(2)
      ..write(obj.workMemo)
      ..writeByte(3)
      ..write(obj.countList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AthleticAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CountNumberAdapter extends TypeAdapter<CountNumber> {
  @override
  final int typeId = 1;

  @override
  CountNumber read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountNumber(
      fields[0] as int,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CountNumber obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.countNum)
      ..writeByte(1)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountNumberAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
