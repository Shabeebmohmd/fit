// import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';

part 'data_models.g.dart';

@HiveType(typeId: 0)
class UserData {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  double height;

  @HiveField(3)
  double weight;

  UserData({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });

  UserData copyWith({
    String? name,
    int? age,
    double? height,
    double? weight,
    String? imagePath,
  }) {
    return UserData(
      name: name ?? this.name,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }
}
