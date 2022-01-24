import 'package:aphrodate/screens/editProfile.dart';
import 'package:aphrodate/screens/home.dart';
import 'package:aphrodate/services/auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int c=0;
  Auth auth = Auth();
  HomeScreen homeScreen=HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Container(child:Column(
      children: [
        ElevatedButton(onPressed: (){setState(() {
          //EditProfile();
          Navigator.pushNamed(context, '/editProfile');
        });}, child :Text('edit')),
       ElevatedButton(onPressed: ()async{await auth.signout();await Navigator.pushNamed(context, '/');}, child: Text('Logout')),
      ],
    ),);
  }
}




// class Profile{
//   Widget show(){
//     int c=0;
//     return Container(
//       child:Column(
//         children: [
//           ElevatedButton(onPressed:(){c++;}, child: Text('Click')),
//           Text('count is ${c}'),
//         ],
//       ),
//     );
//   }
// }

