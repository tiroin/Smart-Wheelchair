import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  int age;
  int heartRate;

  UserData({required this.age, required this.heartRate});
}

class UserDataProvider extends ChangeNotifier {
  UserData _userData = UserData(age: 0, heartRate: 0);

  UserData get userData => _userData;

  // Định nghĩa một key để lưu trữ dữ liệu trong shared preferences
  static const String userDataKey = 'user_data';

  UserDataProvider() {
    // Tải dữ liệu người dùng từ shared preferences khi provider được tạo
    _loadUserData();
  }

  // Tải dữ liệu người dùng từ shared preferences
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int savedAge = prefs.getInt('age') ?? 0;
    int savedHeartRate = prefs.getInt('heartRate') ?? 0;

    _userData = UserData(age: savedAge, heartRate: savedHeartRate);
    notifyListeners();
  }

  // Lưu dữ liệu người dùng vào shared preferences
  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('age', _userData.age);
    prefs.setInt('heartRate', _userData.heartRate);
  }

  // Cập nhật tuổi với thông báo và lưu vào shared preferences
  void updateAge(int newAge) {
    _userData = UserData(age: newAge, heartRate: _userData.heartRate);
    notifyListeners();
    _saveUserData();
  }

  // Cập nhật nhịp tim với thông báo và lưu vào shared preferences
  void updateHeartRate(int newHeartRate) {
    _userData = UserData(age: _userData.age, heartRate: newHeartRate);
    notifyListeners();
    _saveUserData();
  }
}
class DisplayUserDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the Consumer widget to listen for changes in the UserDataProvider
    return Consumer<UserDataProvider>(
      builder: (context, userDataProvider, child) {
        // Access the UserData from the provider
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
                  'Tuổi: ${userData.age}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Nhịp tim: ${userData.heartRate} bpm',
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

