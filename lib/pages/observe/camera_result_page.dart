import 'dart:io';
import 'package:flutter/material.dart';

class CameraResultPage extends StatelessWidget {
  const CameraResultPage({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: Center(child: Image.file(File(imagePath))),
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
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    // controller: _fieldNameController,
                    decoration: const InputDecoration(hintText: 'キノコの名前'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "発生場所",
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('枯木/倒木')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('草地')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('土')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('その他')
                        ],
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [],
                  // ),
                  CheckboxListTile(
                    // tileColor: Colors.red,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('つば'),
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    // tileColor: Colors.red,
                    title: const Text('つぼ'),
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: double.infinity,
                    child: Text(
                      "傘の下",
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: 1,
                            onChanged: (value) {},
                          ),
                          Text('ひだ')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {},
                          ),
                          Text('しわひだ')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('管孔')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('針')
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Navigator.of(context).pop();
                    },
                    child: Text('保存'),
                  )
                ],
              ),
            ));
  }
}
