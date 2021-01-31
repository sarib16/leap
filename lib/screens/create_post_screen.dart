import 'package:flutter/material.dart';
import 'package:leap/colors/color.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.background,
      body: Center(
        child: Text(
          'Create Post Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
