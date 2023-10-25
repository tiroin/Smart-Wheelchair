import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pngtree-beautiful-blue-medical-advertising-background-picture-image_1147407.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Smart Wheelchair App',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Tên đăng nhập',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Implement your password recovery logic here
                        // Show an alert dialog or navigate to a password recovery screen
                        _showPasswordRecoveryDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                      ),
                      child: const Text('Quên mật khẩu ?', style: TextStyle(fontSize: 20),),
                    ),
                    SizedBox(width: 500,),
                    ElevatedButton(
                      onPressed: () async {
                        Future<bool> loginSuccessful = _performLogin();
                        if (await loginSuccessful) {
                          Navigator.pushNamed(context, '/healthFunctions');
                        } else {
                          _showLoginFailureDialog(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text("Đăng nhập", style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Dangky');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                      ),
                      child: const Text('Đăng kí', style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
    );
  }

  Future<bool> _performLogin() async {
    // Lấy thông tin đăng ký từ SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String registeredUsername = prefs.getString('username') ?? '';
    String registeredPassword = prefs.getString('password') ?? '';

    // So sánh với thông tin nhập vào
    String enteredUsername = _usernameController.text.trim();
    String enteredPassword = _passwordController.text.trim();

    if (enteredUsername == registeredUsername && enteredPassword == registeredPassword) {
      return true; // Đăng nhập thành công
    } else {
      return false; // Đăng nhập không thành công
    }
  }
  void _showLoginFailureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Đăng nhập không thành công'),
        content: Text('Tài khoản hoặc mật khẩu không đúng.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Đóng'),
          ),
        ],
      ),
    );
  }

  void _showPasswordRecoveryDialog(BuildContext context) {
    // Implement your password recovery logic here
    // Show an alert dialog or navigate to a password recovery screen
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quên mật khẩu'),
        content: Text('khôi phục mật khẩu của bạn tại đây.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Đóng'),
          ),
        ],
      ),
    );
  }
}
