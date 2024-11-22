// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModeSettingAdapter extends TypeAdapter<ModeSetting> {
  @override
  final int typeId = 4;

  @override
  ModeSetting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModeSetting(
      modeTitle: fields[0] as String,
      modeStep: fields[1] as int,
      modeColor: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ModeSetting obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.modeTitle)
      ..writeByte(1)
      ..write(obj.modeStep)
      ..writeByte(2)
      ..write(obj.modeColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModeSettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
