import 'package:flutter/material.dart';
import 'package:tugas_hive/model/person.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/info_screen.dart';

main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  await Hive.openBox('peopleBox');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void dispose() {

    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Hive Barra Putra',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: InfoScreen(),
    );
  }
}