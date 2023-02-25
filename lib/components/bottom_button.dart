import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () async {
            // Navigator.of(context).pop();
          },
          child: Text('キャンセル'),
        ),
        SizedBox(
          width: 30,
        ),
        TextButton(
          onPressed: () async {
            // Navigator.of(context).pop();
          },
          child: Text('保存'),
        )
      ],
    );
  }
}
