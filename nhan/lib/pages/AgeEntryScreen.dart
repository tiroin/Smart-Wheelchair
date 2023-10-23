import 'package:flutter/material.dart';

class AgeEntryScreen extends StatefulWidget {
  @override
  _AgeEntryScreenState createState() => _AgeEntryScreenState();
}

class _AgeEntryScreenState extends State<AgeEntryScreen> {
  int age = 0;
  TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ageController.text = age.toString();
  }

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
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final enteredAge = int.tryParse(_ageController.text);
                if (enteredAge != null) {
                  setState(() {
                    age = enteredAge;
                  });

                  // Save the age and move to the next screen
                  final result = await Navigator.pushNamed(context, '/healthFunctions', arguments: age);
                  if (result != null) {
                    // Handle the result from the next screen if needed
                  }
                } else {
                  // Handle invalid age input
                }
              },
              child: Text('Tiếp tục'),
            ),
          ],
        ),
      ),
    );
  }

}