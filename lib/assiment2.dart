// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
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
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _birthDateController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//
//   String _selectedGender = 'Male';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade600,
//         elevation: 10,
//         title: const Row(
//           children: [
//             Icon(Icons.menu,color: Colors.white),
//             SizedBox(width: 10),
//             Text(
//               "Login",
//               style: TextStyle(color: Colors.white),
//             ),
//             Spacer(),
//             Row(
//               children: [
//                 Icon(Icons.search,color: Colors.white),
//                 SizedBox(width: 10,),
//                 Icon(Icons.more_vert,color: Colors.white,),
//
//               ],
//             )
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 controller: _firstNameController,
//                 decoration: InputDecoration(
//                   labelText: 'First Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: _lastNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Last Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Stack(
//                 children: [
//                   TextField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     obscureText: true,
//                   ),
//                   Positioned(
//                     right: 0,
//                     child: IconButton(
//                       icon: Icon(Icons.remove_red_eye),
//                       onPressed: () {
//                         // Add functionality to toggle password visibility if needed
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Stack(
//                 children: [
//                   TextField(
//                     controller: _birthDateController,
//                     decoration: InputDecoration(
//                       labelText: 'Birth Date',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 0,
//                     child: IconButton(
//                       icon: Icon(Icons.date_range),
//                       onPressed: () {
//                         // Add functionality to select birth date if needed
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   Expanded(
//                     child: DropdownButtonFormField<String>(
//                       value: _selectedGender,
//                       onChanged: (newValue) {
//                         setState(() {
//                           _selectedGender = newValue!;
//                         });
//                       },
//                       items: <String>['Male', 'Female']
//                           .map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(
//                         labelText: 'Gender',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: TextField(
//                       controller: _phoneController,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         labelText: 'Phone Number',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         prefixText: '+91 ',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Stack(
//                 children: [
//                   TextField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 0,
//                     child: IconButton(
//                       icon: const Icon(Icons.mail),
//                       onPressed: () {
//                         // Add functionality to send email if needed
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(16),
//         child: ElevatedButton(
//           onPressed: () {
//
//           },
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.all(10),
//             backgroundColor: Colors.blue,
//             foregroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: const Text(
//             'Submit',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }
