import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
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
                  // キャストなしに出来るか？
                  return Image.file(images[index] as File, fit: BoxFit.cover);
                }),
              );
            }),
          ),
        ));
  }
}
