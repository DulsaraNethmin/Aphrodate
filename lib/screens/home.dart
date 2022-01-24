import 'package:aphrodate/screens/chat.dart';
import 'package:aphrodate/screens/editProfile.dart';
import 'package:aphrodate/screens/feed.dart';
import 'package:aphrodate/screens/filter.dart';
import 'package:aphrodate/screens/newPost.dart';
import 'package:aphrodate/screens/profile.dart';
import 'package:aphrodate/services/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Auth auth = Auth();
  Feed feed = Feed();
  Filter filter = Filter();
  NewPost newPost = NewPost();
  Chat chat = Chat();
  Profile profile = Profile();
  EditProfile editProfile = EditProfile();
  int index=0;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final appbar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: index,
      onTap: (value) {
        // Respond to item press.
        setState(() {
          index=value;
        });
        print(index);
      },
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.home_outlined,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Image.asset(
            'images/add-post3.png',
            scale: 1.5,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.chat_bubble_outline,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.person_outline,
            color: Colors.black,
          ),
        ),
      ],
      elevation: 0,
    );

    final topAppBar = AppBar(
      leading: Image.asset(
        'images/app-logo.png',
        scale: 3,
      ),
      title: Text(
        'Aphrodate',
        style: TextStyle(
            fontFamily: 'Comfortaa-Bold', fontSize: 30, color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );

    List<Widget> _widgetOptions = <Widget>[
      feed.show(),
      filter.show(),
      newPost.show(),
      chat.show(),
      profile,
      editProfile,
    ];


    return Scaffold(
      appBar: topAppBar,
      bottomNavigationBar: appbar,
      body: SafeArea(
        child:_widgetOptions[index],
      ),
    );
  }
}

// Row(
// children: [
// ElevatedButton(
// child: Text('logout'),
// onPressed: (){
// print('log out');
// auth.signout();
// Navigator.pushNamed(context, '/');
// },
// ),
// ElevatedButton(
// child: Text('profile'),
// onPressed: (){
// print('profile');
// auth.signout();
// Navigator.pushNamed(context, '/');
// },
// ),
// ],
// ),
