import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text("/second"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.pop('/'),
          child: const Text('back'),
        ),
      ),
    );
  }
}
