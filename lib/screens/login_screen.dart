import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  String _email = 'haisyam@gmail.com';
  String _password = '12345';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Input email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: emailController,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Input Password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                obscureText: true,
                controller: passController,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  
                  print('Email :${emailController.text}' );
                  print('Password : ${passController.text}');

                  if (emailController.text == _email && passController.text == _password) {
                    print('Login Berhasil');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login Berhasil'), backgroundColor: Colors.green),
                      );
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  }else if (emailController.text != _email && passController.text == _password) {
                    print('Email or Password Invalid!');
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email or Password Invalid'), backgroundColor: Colors.redAccent),
                      );
                  }else if (emailController.text == _email && passController.text != _password) {
                    print('Email or Password Invalid!');
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email or Password Invalid'), backgroundColor: Colors.redAccent),
                      );
                  }else {
                    print('Account not found!');
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email or Password Invalid'), backgroundColor: Colors.yellow),
                      );
                  }

                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    ),
    ),
    );
  }
}
