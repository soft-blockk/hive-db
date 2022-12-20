import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)

class users extends HiveObject {

  @HiveField(0)
  late String email;
  
  @HiveField(1)
  late String password;
}
