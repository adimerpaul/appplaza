import 'package:flutter/material.dart';

import '../../colors/Color.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   title: Text('Login Page'),
      // ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset(
              'assets/images/logoPng.png',
              height: 220,
            ),
            Text(
              'Multicines Plaza',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Inicia sesión para continuar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          //   btn continuar con google
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // 1F222A
                  backgroundColor: Color(0xFF1F222A),
                  foregroundColor: Colors.white,
                  // primary: Colors.white,
                  // onPrimary: Colors.black,
                  minimumSize: Size(300, 70),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Continuar con Google',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
