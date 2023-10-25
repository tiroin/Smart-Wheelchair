import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'User.dart';

class thongtin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // AppBar
      appBar: AppBar(
        centerTitle: true,
        title: Text('Thông tin cá nhân', style: TextStyle(fontSize: 30),),
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
                      Navigator.pushNamed(context, '/displayUserData');
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


      // Body
      body: Container(
        child: Stack(
          children: [
            Image.asset('assets/pngtree-beautiful-blue-medical-advertising-background-picture-image_1147407.jpg'),
            Text('Thông tin cá nhân', style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}













