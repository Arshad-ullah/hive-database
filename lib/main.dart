import 'package:flutter/material.dart';
import 'package:hive_database/src/UI/splash/splash.dart';
import 'package:hive_database/src/core/models/student_model.dart';
import 'package:hive_database/src/core/models/usermodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
   Hive.registerAdapter(UserModelAdapter());

    Hive.registerAdapter(StudentModelAdapter());

   await Hive.openBox<UserModel>("user");
   await Hive.openBox<StudentModel>("student");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const SplashScreen(),
    );
  }
}
