// main.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'pages/auth_page.dart';
import 'pages/menu_page.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> _cameras;

// import 'pages/area_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
    // home: AreaListPage());
  }
}
