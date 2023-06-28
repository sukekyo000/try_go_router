
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPagePage extends StatelessWidget {
  const MyPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // go_router使用時
                context.push("/non_nav");

                // go_router未使用時
                // Navigator.of(context).push(
                //   PageRouteBuilder(
                //     pageBuilder: (context, animation, secondaryAnimation) => const NonBottomNavBarPage(),
                //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                //       // 遷移時のアニメーションを指定
                //       const Offset begin = Offset(0.0, 1.0);
                //       const Offset end = Offset.zero;
                //       final Tween<Offset> tween = Tween(begin: begin, end: end);
                //       final Animation<Offset> offsetAnimation = animation.drive(tween);
                //       return SlideTransition(
                //         position: offsetAnimation,
                //         child: child,
                //       );
                //     },
                //   )
                // );
              },
              child: const Text("ボトムバー無しのページに遷移"),
            ),
            ElevatedButton(
              onPressed: () => context.push("/my_page/settings"),
              child: const Text("設定ページに遷移"),
            ),
          ],
        ),
      ),
    );
  }
}