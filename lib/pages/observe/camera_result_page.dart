import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kinoko_note/components/bottom_sheet.dart';
import 'package:kinoko_note/pages/menu_page.dart';
import '../../model/observation.dart';

class Iobservation {
  late String name;
  late String imageName;
}

class CameraResultPage extends StatefulWidget {
  const CameraResultPage({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  State<CameraResultPage> createState() => _CameraResultPageState();
}

class _CameraResultPageState extends State<CameraResultPage> {
  late String imagePath;
  late AppDatabase db;
  late Iobservation observation;

  void setName(String name) {
    observation.name = name;
  }

  void setImagePath(String imageName) {
    observation.imageName = imageName;
  }

  @override
  void initState() {
    super.initState();
    imagePath = widget.imagePath;
    observation = new Iobservation();
    db = AppDatabase();
  }

  Future<int> addObservation() async {
    // print('保存データーーーーーーーーーーー');
    // var test = await this.db.allObservationEntries;
    // print(test);
    return this.db.addObservation(this.observation.name, this.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            width: 600,
            height: 240,
            child: Image.file(File(imagePath), fit: BoxFit.cover),
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text('登録'),
                onPressed: () async {
                  await this.addObservation();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuPage()),
                  );
                },
              ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context),

        // onPressed: () async {
        // },
        child: Icon(Icons.edit_note),
      ),
    );
  }

  void _showForm(context) async {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        builder: (_) => builderBottomSheet(context, setName));
  }
}
