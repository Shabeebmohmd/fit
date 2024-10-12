import 'package:hive/hive.dart';
part 'bmi_model.g.dart';

@HiveType(typeId: 4)
class BmiModel {
  @HiveField(0)
  String bmiCategory;

  @HiveField(1)
  double bmiValue;

  @HiveField(2)
  DateTime time;

  BmiModel({
    required this.bmiCategory,
    required this.bmiValue,
    required this.time,
  });
}
