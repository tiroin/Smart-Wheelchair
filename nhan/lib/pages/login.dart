import 'package:flutter/material.dart';

class LoginActivity extends StatelessWidget {
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
              mainAxisAlignment: MainAxisAlignment.center,                // Để canh giữa các phần tử
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
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(12.0),
                //   child: Image.asset(
                //     'assets/394907133_1923884571345888_7356499100869062460_n.png',
                //     width: 100,
                //     height: 100,
                //   ),
                // ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Tên đăng nhập',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
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
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue,
                            ),
                            child: const Text('Quên mật khẩu ?', style: TextStyle(fontSize: 20),)
                        ),
                    SizedBox(width: 500,),
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
                        child: const Text("Đăng nhập", style: TextStyle(fontSize: 20),)
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                        ),
                        child: const Text('Đăng kí', style: TextStyle(fontSize: 20),)
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
}