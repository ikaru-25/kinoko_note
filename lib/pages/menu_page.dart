import 'package:flutter/material.dart';
import './observe/camera_page.dart';
import 'package:kinoko_note/components/bottom_navigation.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            '観察スタート',
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(150, 150),
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: const CircleBorder(
                // side: BorderSide(
                //     // color: Colors.black,
                //     // width: 200,
                //     // style: BorderStyle.solid,
                //     ),
                ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraPage()),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
