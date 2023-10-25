import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'User.dart';

class AgeEntryScreen extends StatefulWidget {
  @override
  _AgeEntryScreenState createState() => _AgeEntryScreenState();
}

class _AgeEntryScreenState extends State<AgeEntryScreen> {
  TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hãy nhập vào số tuổi của bạn'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Số tuổi của bạn là:',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _ageController, // Add this line
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final newAge = int.tryParse(value) ?? 0;
                Provider.of<UserDataProvider>(context, listen: false).updateAge(newAge);
              },
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/healthFunctions');
              }, // Add a comma here
              child: Text('Tiếp tục'),
            ),
          ],
        ),
      ),
    );
  }
}
