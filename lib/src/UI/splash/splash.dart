import 'package:flutter/material.dart';
import 'package:hive_database/src/UI/hive_database/hive_database.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
   Future.delayed(const Duration(seconds: 3),()
   {
    // do something

    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HiveDatabaseScreen()));

   });
    
    
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:CircularProgressIndicator()),
    );
  }
}