import 'package:flutter/material.dart';
import 'package:kinoko_note/components/bottom_navigation.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
            // Animate(
            //   effects: [FadeEffect(), ScaleEffect()],
            //   child: ListTile(
            //     leading: Icon(Icons.add_a_photo),
            //     title: Text("カメラ"),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(Icons.computer),
            //   title: Text("PC"),
            // ),
            // ListTile(
            //   leading: Icon(Icons.mobile_screen_share),
            //   title: Text("スマートフォン"),
            // ),
            Image.asset('assets/icons/ico_main.png', width: 200)
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 2.seconds) // 点滅
                .shake(duration: 1.seconds) // 揺れ
                .slideX(duration: 1.seconds), // X軸方向に移動

            // 別の書き方
            // Animate(
            //   effects: [FadeEffect(), ScaleEffect()],
            //   child: Image.asset('assets/icons/ico_main.png', width: 200),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
