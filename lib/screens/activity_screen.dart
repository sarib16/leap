import 'package:flutter/material.dart';
import 'package:leap/colors/color.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.background,
      body: Center(
        child: Text(
          'Activity Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
