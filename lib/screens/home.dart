import 'package:aphrodate/services/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Auth auth =Auth();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final appbar=BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF6200EE),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(
          label: 'Favorites',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'Music',
          icon: Icon(Icons.music_note),
        ),
        BottomNavigationBarItem(
          label: 'Places',
          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          label: 'News',
          icon: Icon(Icons.library_books),
        ),
      ],
    );

    final topAppBar=AppBar(
      leading: Image.asset('images/rose-red.png',width: mq.size.width/2,height: 10,),
      title: Text(
          'Aphrodate',
              style: TextStyle(fontFamily: 'Comfortaa-Bold',fontSize: 30),
      ),
      backgroundColor: Colors.black,
    );

    return Scaffold(
      appBar:topAppBar ,
      bottomNavigationBar: appbar,
      body: SafeArea(
      child:Text('body'),
    ),);
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
