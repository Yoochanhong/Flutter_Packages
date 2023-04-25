import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttersecurestorage/main.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  final storage = FlutterSecureStorage();
  dynamic userInfo = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userInfo = await storage.read(key: 'login');
      if (userInfo == null) {
        print('로그인 페이지로 이동');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                storage.delete(key: 'login');
                storage.delete(key: 'accessToken');
                storage.delete(key: 'refreshToken');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: const Center(
        child: Text('로그인 성공'),
      ),
    );
  }
}
