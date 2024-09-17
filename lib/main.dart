import 'package:firebase_core/firebase_core.dart';
import 'package:first_app_lpu/Farmer_market/Farmer_dashboard.dart';
import 'package:first_app_lpu/Farmer_market/page/select_type.dart';

import 'package:first_app_lpu/pages/splash%20screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'authentication.dart';
import 'pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  void _checkUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: _user == null ? SplashPage() : FarmerApp(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Define focus nodes for text fields
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _isPasswordVisible = false; // State variable for password visibility

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade700,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LogIn",
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      SizedBox(height: 30),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       elevation: 5,
                  //       padding: EdgeInsets.symmetric(vertical: 17),
                  //       backgroundColor: Colors.black,
                  //       foregroundColor: Colors.white,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(6),
                  //       ),
                  //     ),
                  //     onPressed: () async {
                  //       User? user = await AuthService().signInWithGoogle();
                  //       if (user != null) {
                  //         Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(builder: (context) => const Messagepage(title: 'message')),
                  //         );
                  //       } else {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           const SnackBar(
                  //             content: Text('Google sign-in failed'),
                  //             backgroundColor: Colors.red,
                  //             behavior: SnackBarBehavior.floating,
                  //             margin: EdgeInsets.all(5),
                  //           ),
                  //         );
                  //       }
                  //     },
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image.asset(
                  //           "assets/images/google1.webp",
                  //           height: 20,
                  //         ),
                  //         const SizedBox(width: 10),
                  //         const Text(
                  //           'Sign in with Google',
                  //           style: TextStyle(fontSize: 16),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  //     SizedBox(height: 20,),
                  //     Text(" continue with email", style: TextStyle(fontSize: 16),),
                      SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        focusNode: _emailFocus,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline),
                          labelText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: 'Enter your password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),
                      //Text("Forget your password?", style: TextStyle(fontSize: 16, color: Colors.blue.shade700),),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity, // Button expands to full width
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.blue.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 7,
                          ),
                          onPressed: () {
                            _login();
                            String email = _emailController.text;
                            String password = _passwordController.text;

                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in all fields'),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.all(5),
                                ),
                              );
                            }
                          },
                          child: const Text('Login', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Not a member?'),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignupPage()),
                              );
                            },
                            child: const Text(
                              'Signup now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("User Login Successfully ");
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Successfully Login ", style: TextStyle(color: Colors.green),),
          actions: [
            TextButton(onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                      builder: (context) => SelectionPage()));
            }, child: Text("Ok")),
          ],
        );
      });
    } else {
      print("Failed to create user");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to login'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        ),
      );
    }
  }
}
