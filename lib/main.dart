import 'package:flutter/material.dart';
import 'package:kinoko_note/src/data/db.dart';
import 'pages/menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
