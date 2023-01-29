// main.dart

import 'package:flutter/material.dart';
import './observe/camera_page.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // AlertDialog();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CameraPage()),
              // );
            },
            child: Card(
              color: Colors.teal[200],
              margin: const EdgeInsets.all(15),
              child: ListTile(
                title: Text("観察"),
              ),
            ),
          ),
          GestureDetector(
            child: Card(
              color: Colors.teal[200],
              margin: const EdgeInsets.all(15),
              child: ListTile(
                title: Text("図鑑"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
