import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("/"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => context.push('/second'),
                child: const Text("second_page")),
            TextButton(
                onPressed: () => context.go('/third'),
                child: const Text("third_page")),
          ],
        ),
      ),
    );
  }
}
