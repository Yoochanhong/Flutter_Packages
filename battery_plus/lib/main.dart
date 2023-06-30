import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

void main() => runApp(const MyApp());

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
  Battery battery = Battery();
  Future? batteryLevel;

  @override
  void initState() {
    super.initState();
    batteryLevel = getBatteryLevel();
  }

  Future getBatteryLevel() async {
    final btyLevel = await battery.batteryLevel;
    return btyLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: batteryLevel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
