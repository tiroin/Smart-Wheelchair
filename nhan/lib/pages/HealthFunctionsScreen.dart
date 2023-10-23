import 'package:flutter/material.dart';

class HealthFunctionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Trang chủ', style: TextStyle(fontSize: 30),),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(1.0, kToolbarHeight, 0.0, kToolbarHeight),
                    items: [
                      PopupMenuItem(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Login');
                          },
                          child: Text('Đăng xuất'),
                        ),
                      ),
                      PopupMenuItem(
                        child: ElevatedButton(
                          onPressed: () {
                            // Xử lý cho Option 2
                          },
                          child: Text('Option 2'),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
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


      // Body
      body: Container(
        child: Stack(
          children: [
            Image.asset('assets/pngtree-beautiful-blue-medical-advertising-background-picture-image_1147407.jpg'),
            Center(
              child:
                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20,),
                  const Text(
                    'Welcome to Health Functions!',
                    style: TextStyle(
                      fontSize: 35,
                      backgroundColor: Colors.deepPurple,
                      color: Colors.white,
                    ),
                  ),
                  const Row(
                    children: [
                      SizedBox(height: 50,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 180,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/BloodPressureMeasurement');
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(350, 50),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                            side: const BorderSide(width: 2, color: Colors.deepPurple),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit, size: 30,),
                              Text('Chức năng đo huyết áp', style: TextStyle(fontSize: 20),),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(
                        width: 150,
                        height: 180,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/HeartRateMeasurement');
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(350, 50),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                            side: const BorderSide(width: 2, color: Colors.deepPurple),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit, size: 30,),
                              Text('Chức năng đo nhịp tim', style: TextStyle(fontSize: 20),),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(
                        width: 150,
                        height: 180,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(350, 50),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                            side: const BorderSide(width: 2, color: Colors.deepPurple),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit, size: 30,),
                              Text('Định vị thông minh', style: TextStyle(fontSize: 20),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}














