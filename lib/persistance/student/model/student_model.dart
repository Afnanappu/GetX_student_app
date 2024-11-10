import 'package:hive_flutter/hive_flutter.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String age;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String father;
  @HiveField(5)
  String profile;

  StudentModel({
    this.id,
    required this.name,
    required this.age,
    required this.phone,
    required this.father,
    required this.profile,
  });
}
