
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){
                context.push("/settings/detail");
              },
              child: const Text("詳細ページに遷移"),
            ),
            ElevatedButton(
              onPressed: (){
                context.push("/notification");
              },
              child: const Text("通知ページ"),
            ),
          ],
        ),
      ),
    );
  }
}