import 'package:flutter/material.dart';

class HeartRateMeasurementScreen extends StatefulWidget {
  @override
  _HeartRateMeasurementScreenState createState() => _HeartRateMeasurementScreenState();
}

class _HeartRateMeasurementScreenState extends State<HeartRateMeasurementScreen> {
  int heartRate = 0;

  @override
  Widget build(BuildContext context) {
    String heartstatus;
    Color textColor1 = Colors.red;
    if(heartRate==0){heartstatus='';}
    else if(heartRate < 60 ){
      heartstatus='nhịp tim thấp';
    }
    else if(heartRate > 100 ){
      heartstatus='nhịp tim cao';
    }
    else heartstatus='nhịp tim bình thường';


    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Đo nhịp tim', style: TextStyle(fontSize: 30),),
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
            Text(
              'Enter Heart Rate:',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  heartRate = int.tryParse(value) ?? 0;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Implement heart rate calculation logic here
                // For example, you can calculate and display the result based on the heartRate value.
              },
              child: Text('Calculate Heart Rate'),
            ),
            // Display the heart rate result
            Text(
              heartstatus,
              style: TextStyle(fontSize: 20, color: textColor1),
            ),
            Text(
              'Nhịp tim của bạn: $heartRate bpm',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}