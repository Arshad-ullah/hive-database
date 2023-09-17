import 'package:hive/hive.dart';
part 'usermodel.g.dart';
@HiveType(typeId: 0)
class UserModel
{
  @HiveField(0)
  String title;
  @HiveField(1)
  String age;
  UserModel({required this.age,required this.title});

}