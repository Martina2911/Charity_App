import 'package:firebase1/screens/additem/services.dart';
import 'package:flutter/material.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen({Key? key}) : super(key: key);
  final ser =AddItemServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: ()
            {
            ser.addToFireStore();
            },
              child: Text('add to data')),
        ],
      ),
    );
  }
}
