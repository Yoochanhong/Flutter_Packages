import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("/third"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.go('/'),
          child: const Text('back'),
        ),
      ),
    );
  }
}
