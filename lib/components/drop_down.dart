import 'package:flutter/material.dart';

const List<String> list = <String>['test1', 'test2'];

// '半球形',
// 'まんじゅう形',
// '中高の平形',
// '円錐形',
// '釣鐘形',
// '円筒形',
// '中央くぼみ',
// '漏斗形',
// '半円形',
// '扇形',
// 'へら形'
class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = list.first;

  // const _DropdownState({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return DropdownButton(
      value: dropdownValue,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.teal),
      underline: Container(
        height: 2,
        color: Colors.teal,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
    );
  }
}
