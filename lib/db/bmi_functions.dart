import 'package:fit/models/bmi_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<BmiModel>> bmiNotifier = ValueNotifier([]);

Future<void> addBmi(
  String bmiresult,
  double bmivalue,
) async {
  var box = Hive.box<BmiModel>('bmiBox');
  var newBmi = BmiModel(
      bmiCategory: bmiresult, bmiValue: bmivalue, time: DateTime.now());
  await box.add(newBmi);
  bmiNotifier.value.add(newBmi);
}

Future<void> loadAllBmi() async {
  var box = Hive.box<BmiModel>('bmiBox');
  bmiNotifier.value = box.values.toList();
  bmiNotifier.notifyListeners();
}

Future<void> editBmi(int index, BmiModel updatedBmi) async {
  var box = Hive.box<BmiModel>('bmiBox');
  await box.putAt(index, updatedBmi);
  bmiNotifier.value[index] = updatedBmi;
  bmiNotifier.notifyListeners();
}

Future<void> deleteBmi(int index) async {
  var box = Hive.box<BmiModel>('bmiBox');
  await box.deleteAt(index);
  bmiNotifier.value.removeAt(index);
  bmiNotifier.notifyListeners();
}
