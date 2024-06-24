
//SnackBar.....Widget

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade600,
//         elevation: 10,
//         title: Text('home'),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             width: 200,
//             height: 200,
//             color: Colors.green,
//             padding: EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('hi there im snackbar'),
//                     backgroundColor: Colors.red,
//                     behavior: SnackBarBehavior.floating,
//                     margin: EdgeInsets.all(5),
//                   ),
//                 );
//               },
//               child: Text('click'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


//login page credtinals

// import 'package:flutter/material.dart';
// import 'signupPage.dart'; // Assuming these are correctly imported
// import 'loginPage.dart'; // Assuming these are correctly imported
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   // Define focus nodes for text fields
//   final FocusNode _emailFocus = FocusNode();
//   final FocusNode _passwordFocus = FocusNode();
//
//   @override
//   void dispose() {
//     _emailFocus.dispose();
//     _passwordFocus.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent.shade700,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Material(
//             elevation: 10,
//             borderRadius: BorderRadius.circular(20),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Container(
//                 width: 400,
//                 height: 600,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Log In',
//                         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 30),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             elevation: 5,
//                             padding: EdgeInsets.symmetric(vertical: 17),
//                             backgroundColor: Colors.black,
//                             foregroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                           ),
//                           onPressed: () {
//                             // Add Google login functionality here
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/images/google1.webp",
//                                 height: 20, // Adjust the height as needed
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 'Sign in with Google',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       Text("or continue with email",style: TextStyle(fontSize: 16),),
//                       SizedBox(height: 16),
//                       TextField(
//                         controller: _emailController,
//                         focusNode: _emailFocus,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.mail_outline),
//                           labelText: 'Enter your email',
//
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                               width: 2.0,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black, width: 2.0),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       TextField(
//                         controller: _passwordController,
//                         focusNode: _passwordFocus,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.lock_outline),
//                           labelText: 'Enter your password',
//                           suffixIcon: Icon(Icons.remove_red_eye_outlined),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                               width: 2.0,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black, width: 2.0),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 16,),
//                       Text("Forget your pssword?",style: TextStyle(fontSize: 16,color: Colors.blue.shade700),),
//                       const SizedBox(height: 16),
//                       SizedBox(
//                         width: double.infinity, // Button expands to full width
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.symmetric(vertical: 16),
//                             backgroundColor: Colors.blue.shade700,
//                             foregroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             elevation: 7,
//                           ),
//                           onPressed: () {
//                             String email = _emailController.text;
//                             String password = _passwordController.text;
//
//                             if (email.isEmpty || password.isEmpty) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Please fill in all fields'),
//                                   backgroundColor: Colors.red,
//                                   behavior: SnackBarBehavior.floating,
//                                   margin: EdgeInsets.all(5),
//                                 ),
//                               );
//                             } else {
//                               // Handle login action here
//                               print('Email: $email, Password: $password');
//                             }
//                           },
//                           child: const Text('Login', style: TextStyle(fontSize: 20)),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text('Not a member?'),
//                           const SizedBox(width: 10),
//                           InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => const SignupPage()),
//                               );
//                             },
//                             child: const Text(
//                               'Signup now',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// making the message page using listview separator

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var arrNames = [
//     'Laurent', 'Tracy', 'Claire', 'Joe', 'Mark', 'Willams'
//   ];
//
//   var subtitles = [
//     'How about meeting tomorrow?',
//     "I love that idea, it's great!",
//     "I wasn't aware of that, let me check.",
//     "Flutter just released version 1.0 officially!",
//     "It totally makes sense to get some extra day off.",
//     "It has been rescheduled to next Saturday at 7:30 PM.",
//   ];
//
//   var times = [
//     '19:00',
//     '19:22',
//     '14:34',
//     '11:05',
//     '09:30',
//     '08:15',
//   ];
//
//   var images = [
//     "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjExMjAtZWxlbWVudC0xOS5wbmc.png",
//     "https://i.pinimg.com/originals/d4/73/f3/d473f390ed78cc845580d8f4911cac3a.jpg",
//     "https://i.pinimg.com/736x/29/16/d0/2916d01b37ff2c6b1b4865db785b7ced.jpg",
//     "https://e7.pngegg.com/pngimages/598/62/png-clipart-face-smiley-happiness-faces-image-file-formats-photography.png",
//     "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwMzQtZWxlbWVudC0wNy00MDMucG5n.png",
//     "https://e7.pngegg.com/pngimages/942/789/png-clipart-adobe-creative-cloud-adobe-bridge-face-gimp-recruiter-face-photography.png",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade700,
//         title: Text("Message", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//       ),
//       body: ListView.separated(
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//               ),
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(images[index % images.length]),
//               ),
//             ),
//             title: Row(
//               children: [
//                 Text(arrNames[index]),
//                 SizedBox(width: 16),
//                 Text(
//                   times[index],
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ],
//             ),
//             subtitle: Text(subtitles[index]),
//             trailing: Icon(Icons.arrow_forward_ios_outlined),
//           );
//         },
//         itemCount: arrNames.length,
//         separatorBuilder: (context, index) {
//           return Divider(height: 40, thickness: 2);
//         },
//       ),
//     );
//   }
// }
