import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  int age;
  int heartRate;
  String name;
  String username;
  String password;

  UserData({required this.age, required this.heartRate, required this.name, required this.username, required this.password});
}

class UserDataProvider extends ChangeNotifier {
  UserData _userData = UserData(age: 0, heartRate: 0, name: '', username: '', password: '');

  UserData get userData => _userData;

  // Define a key to store data in shared preferences
  static const String userDataKey = 'user_data';

  UserDataProvider() {
    // Load user data from shared preferences when the provider is created
    _loadUserData();
  }

  // Load user data from shared preferences
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int savedAge = prefs.getInt('age') ?? 0;
    int savedHeartRate = prefs.getInt('heartRate') ?? 0;
    String savedName = prefs.getString('name') ?? '';
    String savedUsername = prefs.getString('username') ?? '';
    String savedPassword = prefs.getString('password') ?? '';

    _userData = UserData(age: savedAge, heartRate: savedHeartRate, name: savedName, username: savedUsername, password: savedPassword);
    notifyListeners();
  }

  // Save user data to shared preferences
  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('age', _userData.age);
    prefs.setInt('heartRate', _userData.heartRate);
    prefs.setString('name', _userData.name);
    prefs.setString('username', _userData.username);
    prefs.setString('password', _userData.password);
  }

  // Update age with notification and save to shared preferences
  void updateAge(int newAge) {
    _userData = UserData(age: newAge, heartRate: _userData.heartRate, name: _userData.name, username: _userData.username, password: _userData.password);
    notifyListeners();
    _saveUserData();
  }

  // Update heart rate with notification and save to shared preferences
  void updateHeartRate(int newHeartRate) {
    _userData = UserData(age: _userData.age, heartRate: newHeartRate, name: _userData.name, username: _userData.username, password: _userData.password);
    notifyListeners();
    _saveUserData();
  }

  // Update name with notification and save to shared preferences
  void updateName(String name) {
    _userData = UserData(age: _userData.age, heartRate: _userData.heartRate, name: name, username: _userData.username, password: _userData.password);
    notifyListeners();
    _saveUserData();
  }
  void updateUsername(String username) {
    _userData = UserData(
        age: _userData.age,
        heartRate: _userData.heartRate,
        name: _userData.name,
        username: username,
        password: _userData.password);
    notifyListeners();
    _saveUserData();
  }

  void updatePassword(String password) {
    _userData = UserData(
        age: _userData.age,
        heartRate: _userData.heartRate,
        name: _userData.name,
        username: _userData.username,
        password: password);
    notifyListeners();
    _saveUserData();
  }

  // Perform user registration
  void registerUser(String name, String username, String password) {
    // Save user registration data
    _userData = UserData(age: 0, heartRate: 0, name: name, username: username, password: password);
    notifyListeners();
    _saveUserData();
  }

  // Perform user login
  bool loginUser(String enteredUsername, String enteredPassword) {
    // Check if entered username and password match
    if (_userData.username == enteredUsername && _userData.password == enteredPassword) {
      return true; // Login successful
    } else {
      return false; // Login unsuccessful
    }
  }
}

// DisplayUserDataScreen remains the same
class DisplayUserDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (context, userDataProvider, child) {
        UserData userData = userDataProvider.userData;

        return Scaffold(
          appBar: AppBar(
            title: Text('Thông Tin Người Dùng'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tên: ${userData.name}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Tuổi: ${userData.age}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Nhịp tim: ${userData.heartRate} bpm',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Tài khoản: ${userData.username}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Mật khẩu: ${userData.password}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
