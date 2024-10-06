import 'package:hive/hive.dart';

part 'diet_model.g.dart';

@HiveType(typeId: 3)
class DietPlan {
  @HiveField(0)
  String headline;
  @HiveField(1)
  String details;

  DietPlan({required this.headline, required this.details});

  get category => null;
}
