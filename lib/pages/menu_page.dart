// main.dart

import 'package:flutter/material.dart';
import './observe/camera_page.dart';
import 'index_page.dart';
import 'package:camera/camera.dart';

class MenuPage extends StatelessWidget {
  // カメラを取得
  Future<CameraDescription> _getCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    // 最初のカメラを取得
    return Future.value(cameras.first);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('きのこノート'),
        ),
        body: Center(
            child: FutureBuilder(
                future: _getCamera(),
                builder: ((BuildContext context,
                    AsyncSnapshot<CameraDescription> snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return ListView(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CameraPage(
                                        camera: snapshot.data
                                            as CameraDescription)));
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
                              MaterialPageRoute(
                                  builder: (context) => IndexPage()),
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
                              MaterialPageRoute(
                                  builder: (context) => IndexPage()),
                            );
                          },
                          child: Card(
                            color: Colors.teal[200],
                            margin: const EdgeInsets.all(15),
                            child: ListTile(
                              leading: Icon(Icons.search),
                              title: Text("観察ガイド"),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }))));
  }
}
