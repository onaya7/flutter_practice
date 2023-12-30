import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

RegExp regex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
final _formKey = GlobalKey<FormState>();
const Map<String, dynamic> _emailError = {
  'EmptyEmail': '*Please enter your email',
  'InvalidEmail': '*Please enter a valid email'
};
const Map<String, dynamic> _passwordError = {
  'EmptyPassword': '*Please enter your password',
  'InvalidPassword':
      '*Please enter a valid password, \n*password must be at least 8 characters'
};

class _SignUpPageState extends State<SignUpPage> {
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('sign up successfull');
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
