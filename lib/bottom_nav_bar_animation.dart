
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarAnimation {
  // 下から上へのアニメーション
  CustomTransitionPage transitionWithBottomToUp(Widget page){
    return CustomTransitionPage(
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // 遷移時のアニメーションを指定
        const Offset begin = Offset(0.0, 1.0);
        const Offset end = Offset.zero;
        final Tween<Offset> tween = Tween(begin: begin, end: end);
        final Animation<Offset> offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}