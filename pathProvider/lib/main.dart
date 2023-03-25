import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.start),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(width: 1, color: Colors.black12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> getLocalPath() async {
  final dir = await getApplicationDocumentsDirectory();
  return dir.path;
}

Future<File> getLocalFile() async {
  final path = await getLocalPath();
  return File('$path/temp.txt');
}

Future<File> writeString(String str) async {
  final file = await getLocalFile();

  return file.writeAsString(str);
}

Future<String> readString() async {
  try {
    final file = await getLocalFile();
    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    return "에러";
  }
}
