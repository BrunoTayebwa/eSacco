import 'package:flutter/material.dart';

class ChooseKibiina extends StatefulWidget {
  @override
  _ChooseKibiinaState createState() => _ChooseKibiinaState();
}

class _ChooseKibiinaState extends State<ChooseKibiina> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Choose Group under construction',
              style: TextStyle(
                fontSize: 38,
                color: Colors.grey[800],
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
