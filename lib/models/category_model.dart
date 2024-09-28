import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel {
  @HiveField(0)
  String categoryName;

  @HiveField(1)
  String boxName;

  CategoryModel({
    required this.boxName,
    required this.categoryName,
  });
}
