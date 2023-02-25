import 'package:flutter/material.dart';
import 'package:kinoko_note/components/bottom_button.dart';

Widget builderBottomSheet(context, Function setFormData) {
  return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        // this will prevent the soft keyboard from covering the text fields
        bottom: MediaQuery.of(context).viewInsets.bottom + 120,
      ),
      child: Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  setFormData(value);
                },
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
                child: Text('OK'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(200),
                ),
              ),
            ],
          ),
        ],
      ));
}
