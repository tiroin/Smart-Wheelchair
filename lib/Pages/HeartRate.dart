import 'package:flutter/material.dart';
import 'User.dart';
import 'package:provider/provider.dart';
class HeartRateMeasurementScreen extends StatefulWidget {
  @override
  _HeartRateMeasurementScreenState createState() => _HeartRateMeasurementScreenState();
}

class _HeartRateMeasurementScreenState extends State<HeartRateMeasurementScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Đo nhịp tim',
          style: TextStyle(fontSize: 30),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // BottomAppBar code here...
      ),
      body: Consumer<UserDataProvider>(
        builder: (context, userDataProvider, child) {
          UserData userData = userDataProvider.userData;
          String heartstatus;
          Color textColor1 = Colors.red;

          if (userData.heartRate == 0) {
            heartstatus = '';
          } else if (userData.heartRate < 60) {
            heartstatus = 'nhịp tim thấp';
          } else if (userData.heartRate > 100) {
            heartstatus = 'nhịp tim cao';
          } else
            heartstatus = 'nhịp tim bình thường';

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Enter Heart Rate:',
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      userDataProvider.updateHeartRate(int.tryParse(value) ?? 0);
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // You can implement heart rate calculation logic here
                    // For example, you can calculate and display the result based on the userData.heartRate value.
                  },
                  child: Text('Calculate Heart Rate'),
                ),
                Text(
                  heartstatus,
                  style: TextStyle(fontSize: 20, color: textColor1),
                ),
                Text(
                  'Nhịp tim của bạn: ${userData.heartRate} bpm',
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save user data and move to the next screen
                    Navigator.pushNamed(context, '/nextScreen', arguments: userData);
                  },
                  child: Text('Save and Move to Next Screen'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}