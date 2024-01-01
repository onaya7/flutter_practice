import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _emailError = {
    'EmptyEmail': '*Please enter your email',
    'InvalidEmail': '*Please enter a valid email'
  };
  final Map<String, dynamic> _passwordError = {
    'EmptyPassword': '*Please enter your password',
    'InvalidPassword':
        '*Please enter a valid password, \n*password must be at least 8 characters'
  };

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Auth _auth = Auth();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Sign up Page',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  // check if field is empty
                  if (value == null || value.isEmpty) {
                    return _emailError['EmptyEmail'];
                  }
                  // check if email is vallid
                  else if (!regex.hasMatch(value)) {
                    return _emailError['InvalidEmail'];
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return _passwordError['EmptyPassword'];
                  } else if (value.length < 8) {
                    return _passwordError['InvalidPassword'];
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await _auth.signUp(
                            _emailController.text, _passwordController.text);
                        if (!context.mounted) return;
                        Navigator.pushNamed(context, '/login');
                      } on FirebaseAuthException catch (e) {
                        Navigator.pushNamed(context, '/Signup');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.message!),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('sign up'))
            ],
          ),
        ),
      ),
    );
  }
}
