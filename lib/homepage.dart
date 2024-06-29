// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:first_app_lpu/authentication.dart';
// import 'package:first_app_lpu/loginPage.dart';
// import 'package:first_app_lpu/main.dart';
// import 'package:flutter/material.dart';
// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//         backgroundColor: Colors.red,
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 foregroundColor: Colors.white,
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.zero,
//                 ),
//               ),
//               onPressed: (){
//                 FirebaseAuth.instance.signOut();
//                 const snackBar =SnackBar(content: Text("User is sucessfully SignOut"),
//                   backgroundColor: Colors.green,);
//                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home')),
//                 );
//               },
//               child: Text("SignOut"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
