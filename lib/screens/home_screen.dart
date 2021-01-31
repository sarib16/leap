import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leap/colors/color.dart';
import 'package:leap/screens/activity_screen.dart';
import 'package:leap/screens/create_post_screen.dart';
import 'package:leap/screens/feed_screen.dart';
import 'package:leap/screens/profile_screen.dart';
import 'package:leap/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userId;

  HomeScreen({this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        backgroundColor: color.appBar,
        title: Center(
          child: Text(
            'LEAP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Evolve',
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          ActivityScreen(),
          ProfileScreen(
            userId: widget.userId,
          ),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
        backgroundColor: color.bottomBar,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_sharp,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_sharp,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_camera_sharp,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_sharp,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_sharp,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
