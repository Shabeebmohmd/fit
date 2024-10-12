// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BmiModelAdapter extends TypeAdapter<BmiModel> {
  @override
  final int typeId = 4;

  @override
  BmiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BmiModel(
      bmiCategory: fields[0] as String,
      bmiValue: fields[1] as double,
      time: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BmiModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bmiCategory)
      ..writeByte(1)
      ..write(obj.bmiValue)
      ..writeByte(2)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BmiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
