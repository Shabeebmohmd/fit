// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietPlanAdapter extends TypeAdapter<DietPlan> {
  @override
  final int typeId = 3;

  @override
  DietPlan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DietPlan(
      headline: fields[0] as String,
      details: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DietPlan obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.headline)
      ..writeByte(1)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietPlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
