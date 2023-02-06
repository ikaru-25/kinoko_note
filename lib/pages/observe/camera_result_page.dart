import 'dart:io';
import 'package:flutter/material.dart';
import '../../components//bottom_sheet.dart';

class CameraResultPage extends StatelessWidget {
  const CameraResultPage({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

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
        builder: (_) => builderBottomSheet(context));
  }
}
