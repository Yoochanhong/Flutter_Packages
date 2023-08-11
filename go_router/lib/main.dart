import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_package/screen/first_page.dart';
import 'package:go_router_package/screen/second_page.dart';
import 'package:go_router_package/screen/third_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const FirstPage(),
      ),
      GoRoute(
        path: '/second',
        builder: (context, state) => const SecondPage(),
      ),
      GoRoute(
        path: '/third',
        builder: (context, state) => const ThirdPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
