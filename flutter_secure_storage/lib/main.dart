import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage_package/login_response.dart';
import 'package:flutter_secure_storage_package/success_page.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var storage = const FlutterSecureStorage();
  dynamic userInfo = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userInfo = await storage.read(key: 'accessToken');
      if (userInfo != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SuccessPage()),
            (route) => false);
      } else {
        print("로그인이 필요함");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '로그인',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LINE Seed Sans KR',
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 34.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 380.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' 아이디',
                          style: TextStyle(
                            fontFamily: 'LINE Seed Sans KR',
                            color: Color(0xff7F7F7F),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(width: 1, color: Colors.black12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: TextFormField(
                              controller: idController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  SizedBox(
                    width: 380.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' 비밀번호',
                          style: TextStyle(
                            fontFamily: 'LINE Seed Sans KR',
                            color: Color(0xff7F7F7F),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(width: 1, color: Colors.black12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          LoginResponse loginResponse;
                          final response = await http.post(Uri.parse(
                              "http://localhost:8080/signin?id=${idController.text}&password=${passwordController.text}"));
                          if (response.statusCode == 200) {
                            loginResponse = LoginResponse.fromJson(
                                jsonDecode(response.body));
                            storage.write(
                                key: 'accessToken',
                                value: loginResponse.accessToken);
                            storage.write(
                                key: 'refreshToken',
                                value: loginResponse.refreshToken);
                            storage.write(key: 'login', value: "로그인 성공");
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SuccessPage()),
                                (route) => false);
                          } else {
                            throw Exception("아이디나 비밀번호를 잘못 입력함");
                          }
                        },
                        child: const Text("로그인 버튼"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var response = await http.post(Uri.parse(
                              "http://localhost:8080/signup?id=${idController.text}&password=${passwordController.text}"));
                          if (response.statusCode == 202) {
                            print("이미 있는 유저");
                          } else {
                            print("회원가입 완료");
                          }
                        },
                        child: const Text("회원가입 버튼"),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
