import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'User.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Họ và tên'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Tuổi'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Tài khoản'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Mật khẩu'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final String name = _nameController.text.trim();
                  final int age = int.tryParse(_ageController.text) ?? 0;
                  final String username = _usernameController.text.trim();
                  final String password = _passwordController.text.trim();

                  // Perform registration logic here

                  // For example, you can update the user data provider
                  Provider.of<UserDataProvider>(context, listen: false).updateName(name);
                  Provider.of<UserDataProvider>(context, listen: false).updateAge(age);
                  Provider.of<UserDataProvider>(context, listen: false).updateUsername(username);
                  Provider.of<UserDataProvider>(context, listen: false).updatePassword(password);

                  // Simulate successful registration
                  _showRegistrationSuccessDialog(context);
                },
                child: Text('Đăng ký'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRegistrationSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Đăng ký thành công'),
        content: Text('Bạn đã đăng ký thành công!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Navigate back to the login screen
              Navigator.pop(context,'/Login');
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
