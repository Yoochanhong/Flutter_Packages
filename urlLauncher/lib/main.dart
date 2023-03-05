import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse('https://youtube.com'));
              },
              child: Text('유튜브'),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse('tel: 010 6286 3930'));
              },
              child: Text('전화하기'),
            ),
            ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse('sms: 010 6286 3930'));
                },
                child: Text('문자')),
          ],
        ),
      ),
    );
  }
}
