import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pullupfighter/model/mode_model.dart';
import 'package:pullupfighter/providers/count_provider.dart';
import 'package:pullupfighter/providers/workout_provider.dart';

import 'model/workout_model.dart';
import 'screens/fighter_home.dart';

// flutter pub add hive_flutter
// flutter packages pub run build_runner build



void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(WorkOutAdapter());
  Hive.registerAdapter(ModeSettingAdapter());
  Hive.openBox<ModeSetting>('modeBox');


  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (context) => WorkoutProvider()),
      ChangeNotifierProvider(create: (context) => CountdownTimerProvider()),
    ]
    ,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const FighterPullup(),
    );
  }
}
