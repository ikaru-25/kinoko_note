import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> _shapes = <String>[
  '半球形',
  'まんじゅう形',
  '中高の平形',
  '円錐形',
  '釣鐘形',
  '円筒形',
  '中央くぼみ',
  '漏斗形',
  '半円形',
  '扇形',
  'へら形'
];

class ShapeSelect extends StatefulWidget {
  const ShapeSelect({super.key});

  @override
  State<ShapeSelect> createState() => _ShapeSelectState();
}

class _ShapeSelectState extends State<ShapeSelect> {
  int _selected = 0;

  Future<void> _showDialog(Widget child) async {
    showCupertinoModalPopup(
        context: context,
        builder: ((context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SafeArea(
                top: false,
                child: child,
              ),
            )));
  }

  @override
  Widget build(context) {
    return CupertinoButton(
        child: Text(
          _shapes[_selected],
          style: const TextStyle(
            fontSize: 22.0,
          ),
        ),
        onPressed: () => {
              _showDialog(
                CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 40,
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selected = selectedItem;
                      });
                    },
                    children: List<Widget>.generate(_shapes.length, (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // AssetImage(ZZZZZZZZZZZZZZZZZ),
                          ImageIcon(
                            AssetImage('assets/icons/shape/shape1.png'),
                            size: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(_shapes[index]),
                          )
                        ],
                      );
                    })),
              )
            });
  }
}
