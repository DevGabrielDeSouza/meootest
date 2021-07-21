import 'package:flutter/material.dart';

import '../main.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homePage));
      //performLogin();
    }
  }

  void performLogin() {
    final snackbar = SnackBar(
      content: Text("Email : $_email, password : $_password"),
    );
    scaffoldKey.currentState!.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text("Form Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  key: const Key('user-field'),
                  decoration: const InputDecoration(labelText: "Email"),
                  validator: (val) =>
                      !val!.contains('@') ? 'Invalid Email' : null,
                  onSaved: (val) => _email = val!,
                ),
                TextFormField(
                  key: const Key('password-field'),
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: (val) =>
                      val!.length < 6 ? 'Password too short' : null,
                  onSaved: (val) => _password = val!,
                  obscureText: true,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                RaisedButton(
                  key: const Key('login-button'),
                  child: const Text(
                    "login",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: _submit,
                )
              ],
            ),
          ),
        ));
  }
}
