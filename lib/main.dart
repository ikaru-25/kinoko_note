import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kinoko_note/model/db.dart';
import 'firebase_options.dart';
import 'pages/menu_page.dart';
import 'package:kinoko_note/pages/observe/camera_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final db = AppDatabase();
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.db}) : super(key: key);

  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'BirdWalk',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: MenuPage());
  }
}
