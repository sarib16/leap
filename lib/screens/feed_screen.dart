import 'package:flutter/material.dart';
import 'package:leap/services/auth_service.dart';
import 'package:leap/colors/color.dart';

class FeedScreen extends StatefulWidget {
  static final String id = 'feed_screen';

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.background,
      body: Center(
        child: Container(
          height: 50,
          width: 250,
          child: FlatButton(
            color: color.appBar,
            onPressed: () => AuthService.logout(),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
