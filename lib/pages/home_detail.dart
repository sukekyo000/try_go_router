
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.push("/non_nav"),
              child: const Text("ボトムバー無しのページに遷移"),
            ),
            ElevatedButton(
              onPressed: () => context.go("/my_page/settings"),
              child: const Text("マイページタブ・設定ページに遷移"),
            ),
          ],
        ),
      )
    );
  }
}