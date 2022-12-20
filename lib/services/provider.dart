import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/model.dart';

class saving extends ChangeNotifier {
  late users data;
  final box = Hive.box<users>('users');

  List<users> get value {
    return box.values.toList();
  }

  void addUsers(emaili, passwordi) {
    final user = users()
      ..email = emaili
      ..password = passwordi;
    final res = box.put('key', user);
    res.whenComplete(() => box.values.forEach((element) {
          print(element.email + " " + element.password);
        }));
    notifyListeners();
  }

  void updateUser(users user, emaili, passwordi) {
    user.email = emaili;
    user.password = passwordi;
    user.save();
    notifyListeners();
  }

  void removeuser(users user) {
    user.delete();
    notifyListeners();
  }
}
