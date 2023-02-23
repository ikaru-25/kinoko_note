import 'package:flutter/material.dart';
import './observe/camera_page.dart';
import 'index_page.dart';
import 'package:kinoko_note/components/bottom_navigation.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CameraPage()));
            },
            child: Card(
              color: Colors.teal[200],
              margin: const EdgeInsets.all(15),
              child: ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text("観 察"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IndexPage()),
              );
            },
            child: Card(
              color: Colors.teal[200],
              margin: const EdgeInsets.all(15),
              child: ListTile(
                leading: Icon(Icons.search),
                title: Text("図 鑑"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IndexPage()),
              );
            },
            child: Card(
              color: Colors.teal[200],
              margin: const EdgeInsets.all(15),
              child: ListTile(
                leading: Icon(Icons.import_contacts),
                title: Text("観察ガイド"),
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
