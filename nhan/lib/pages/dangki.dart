import 'package:flutter/material.dart';

class Dangki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pngtree-beautiful-blue-medical-advertising-background-picture-image_1147407.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Smart Wheelchair App',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),)
              ],
            ),
            const SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Họ và Tên',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Giới tính',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Textfield Ngày
                Container(
                  width: 300, // Độ rộng cố định
                  child: TextField(
                    // decoration: InputDecoration(labelText: 'Ngày sinh'),
                    decoration: InputDecoration(
                      hintText: 'Ngày sinh',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                // Textfield Tháng
                Container(
                  width: 300, // Độ rộng cố định
                  child: TextField(
                    // decoration: InputDecoration(labelText: 'Tháng sinh'),
                    decoration: InputDecoration(
                      hintText: 'Tháng sinh',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                // Textfield Năm
                Container(
                  width: 300, // Độ rộng cố định
                  child: TextField(
                    // decoration: InputDecoration(labelText: 'Năm sinh'),
                    decoration: InputDecoration(
                      hintText: 'Năm sinh',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Địa chỉ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Số điện thoại',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                hintText: 'CCCD/ CMND',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/healthFunctions');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                ),
                child: const Text("Đăng kí", style: TextStyle(fontSize: 20),)
            ),
          ],
        )
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Đăng kí'),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nhập ngày tháng năm sinh'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Textfield Ngày
              Container(
                width: 100, // Độ rộng cố định
                child: TextField(
                  decoration: InputDecoration(labelText: 'Ngày'),
                ),
              ),
              // Textfield Tháng
              Container(
                width: 100, // Độ rộng cố định
                child: TextField(
                  decoration: InputDecoration(labelText: 'Tháng'),
                ),
              ),
              // Textfield Năm
              Container(
                width: 100, // Độ rộng cố định
                child: TextField(
                  decoration: InputDecoration(labelText: 'Năm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}