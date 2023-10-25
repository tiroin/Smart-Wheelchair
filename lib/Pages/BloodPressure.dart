import 'package:flutter/material.dart';

class BloodPressureMeasurementScreen extends StatefulWidget {
  @override
  _BloodPressureMeasurementScreenState createState() => _BloodPressureMeasurementScreenState();
}

class _BloodPressureMeasurementScreenState
    extends State<BloodPressureMeasurementScreen> {
  int huyetaptamthu = 0;
  int huyetaptamtruong = 0;

  @override
  Widget build(BuildContext context) {
    // Calculate the blood pressure status based on your conditions
    String bloodPressureStatus = '';

    if (huyetaptamthu == 0 && huyetaptamtruong == 0) {
      bloodPressureStatus = ''; // No text to display
    } else if (huyetaptamthu < 60 || huyetaptamtruong < 90) {
      bloodPressureStatus = 'Huyết áp thấp';
    } else if (huyetaptamthu < 80 || huyetaptamtruong < 120) {
      bloodPressureStatus = 'Huyết áp bình thường';
    } else if (huyetaptamthu < 90 || huyetaptamtruong < 140) {
      bloodPressureStatus = 'Huyết áp tiền cao';
    } else if (huyetaptamthu < 100 || huyetaptamtruong < 190) {
      bloodPressureStatus = 'Huyết áp cao';
    }

    // Determine the text color based on the blood pressure status
    Color textColor = Colors.black; // Default color

    if (bloodPressureStatus == 'Huyết áp thấp') {
      textColor = Colors.green;
    } else if (bloodPressureStatus == 'Huyết áp bình thường') {
      textColor = Colors.blue;
    } else if (bloodPressureStatus == 'Huyết áp tiền cao') {
      textColor = Colors.pink;
    } else if (bloodPressureStatus == 'Huyết áp cao') {
      textColor = Colors.red;
    }


    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Đo huyết áp', style: TextStyle(fontSize: 30),),
      ),

      // BottomBar
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          color: Colors.deepPurple,
          child: Row(
            children: [
              const SizedBox(width: 50,),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/healthFunctions');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      side: const BorderSide(width: 3, color: Colors.white),
                    ),
                    child: const Text('Trang chủ', style: TextStyle(fontSize: 20),),
                  )
              ),
              const SizedBox(width: 50,),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: (){
                      // Navigator.pushNamed(context, '/BloodPressureMeasurement');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      side: const BorderSide(width: 3, color: Colors.white),
                    ),
                    child: const Text('Lịch hẹn', style: TextStyle(fontSize: 20),),
                  )
              ),
              const SizedBox(width: 50,),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: (){
                      // Navigator.pushNamed(context, '/HeartRateMeasurement');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      side: const BorderSide(width: 3, color: Colors.white),
                    ),
                    child: const Text('Thông báo', style: TextStyle(fontSize: 20),),
                  )
              ),
              const SizedBox(width: 50,),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/Thongtin');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      side: const BorderSide(width: 3, color: Colors.white),
                    ),
                    child: const Text('Cá nhân', style: TextStyle(fontSize: 20),),
                  )
              ),
              const SizedBox(width: 50,),
            ],
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter Systolic Pressure (Huyết áp tâm thu):',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  huyetaptamthu = int.tryParse(value) ?? 0;
                });
              },
            ),
            const Text(
              'Enter Diastolic Pressure (Huyết áp tâm trương):',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  huyetaptamtruong = int.tryParse(value) ?? 0;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Calculate Blood Pressure'),
            ),
            Text(
              bloodPressureStatus,
              style: TextStyle(fontSize: 20, color: textColor),
            ),
            Text(
              'Huyết áp tâm thu: $huyetaptamthu',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Huyết áp tâm trương: $huyetaptamtruong',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}


