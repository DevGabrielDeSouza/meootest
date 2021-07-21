import 'package:flutter/material.dart';
import 'package:testpoc/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                key: const Key('user-field'),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              const Divider(),
              TextFormField(
                autofocus: true,
                key: const Key('password-field'),
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              const Divider(),
              ButtonTheme(
                  key: const Key('login-button'),
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homePage))
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 30),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
