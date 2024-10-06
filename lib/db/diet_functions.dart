import 'package:fit/models/diet_model.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<DietPlan>> dietPlansNotifier = ValueNotifier([]);

Future<void> openHiveBoxesForDiet() async {
  await Hive.openBox<DietPlan>('underweight');
  await Hive.openBox<DietPlan>('normal');
  await Hive.openBox<DietPlan>('overweight');
  await Hive.openBox<DietPlan>('obese');
}

List<DietPlan> getAllDietPlans(String categoryBox) {
  var box = Hive.box<DietPlan>(categoryBox);
  return box.values.toList();
}

Future<void> addDietPlan(
    String dietcategory, String headline, String dietplan) async {
  var box = Hive.box<DietPlan>(dietcategory);
  var newDietplan = DietPlan(headline: headline, details: dietplan);
  await box.add(newDietplan);
}

Future<void> editDietPlan(
    String categoryBox, int index, DietPlan updateddiet) async {
  var box = Hive.box<DietPlan>(categoryBox);
  await box.putAt(index, updateddiet);
}

Future<void> deleteDietPlan(String categoryBox, int index) async {
  var box = Hive.box<DietPlan>(categoryBox);
  await box.deleteAt(index);
}
