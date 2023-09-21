import 'package:hive_flutter/hive_flutter.dart';
part 'student_model.g.dart';
@HiveType(typeId: 1)
class StudentModel extends HiveObject
{
  @HiveField(0)
  String name;
  @HiveField(1)
  String address;
  @HiveField(2)
  int age;
  @HiveField(3)
  String fname;

  StudentModel({required this.address,required this.age,required this.fname,required this.name});
}