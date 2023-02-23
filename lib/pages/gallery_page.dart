import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:kinoko_note/components/bottom_navigation.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);
  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late Future<Directory?> _imagePath;

  @override
  void initState() {
    super.initState();
    _imagePath = (getExternalStorageDirectory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: Center(
        child: FutureBuilder<void>(
          future: _imagePath,
          // future: Future.wait([_imagePath]),
          builder: ((context, AsyncSnapshot snapshot) {
            List<FileSystemEntity> images = snapshot.data.listSync();
            return GridView.builder(
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: ((context, index) {
                print(images[index]);
                // キャストなしに出来るか？
                return Image.file(images[index] as File, fit: BoxFit.cover);
              }),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
