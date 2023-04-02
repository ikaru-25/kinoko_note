import 'package:flutter/material.dart';
import 'package:kinoko_note/components/bottom_navigation.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アニメーション テスト'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text("カメラ"),
            ),
            ListTile(
              leading: Icon(Icons.computer),
              title: Text("PC"),
            ),
            ListTile(
              leading: Icon(Icons.mobile_screen_share),
              title: Text("スマートフォン"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
