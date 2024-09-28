import 'package:fit/models/data_models.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

final ValueNotifier<UserData?> userNotifier = ValueNotifier(null);

Future<void> addUserData(
    String name, int age, double height, double weight) async {
  final box = await Hive.openBox<UserData>('userData');
  var userData = UserData(name: name, age: age, height: height, weight: weight);
  await box.put('user', userData);
  userNotifier.value = userData;
}

Future<UserData?> getUserData() async {
  final box = await Hive.openBox<UserData>('userData');
  userNotifier.value = box.get('user');
  return userNotifier.value;
}

Future<void> deleteUser() async {
  final box = await Hive.openBox<UserData>('userData');
  await box.delete('user');
  userNotifier.value = null;
}

Future<void> editUserData(UserData updatedUser) async {
  final box = await Hive.openBox<UserData>('userData');
  await box.put('user', updatedUser);
  userNotifier.value = updatedUser;
}
