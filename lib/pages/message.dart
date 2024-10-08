import 'dart:io';
import 'package:first_app_lpu/pages/seaarchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app_lpu/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../chat/ChatPage.dart';
import '../main.dart';

class Messagepage extends StatefulWidget {
  const Messagepage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Messagepage> createState() => _MessagepageState();
}

class _MessagepageState extends State<Messagepage> {
  File? imageFile;
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _loadProfilePicture();
  }

  void _loadProfilePicture() async {
    _prefs = await SharedPreferences.getInstance();
    String? imagePath = _prefs?.getString('profile_picture');
    if (imagePath != null) {
      setState(() {
        imageFile = File(imagePath);
      });
    }
  }

  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      cropImage(pickedFile);
    }
  }

  void cropImage(XFile file) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 40,
    );

    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
        _prefs?.setString('profile_picture', croppedImage.path);
      });
    }
  }

  void _showChangePictureDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  selectImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Take a photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  selectImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  var arrNames = [
    'Laurent', 'Tracy', 'Claire', 'Joe', 'Mark', 'Willams'
  ];

  var subtitles = [
    'How about meeting tomorrow?',
    "I love that idea, it's great!",
    "I wasn't aware of that, let me check.",
    "Flutter just released version 1.0 officially!",
    "It totally makes sense to get some extra day off.",
    "It has been rescheduled to next Saturday at 7:30 PM.",
  ];

  var times = [
    '19:00',
    '19:22',
    '14:34',
    '11:05',
    '09:30',
    '08:15',
  ];

  var images = [
    "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjExMjAtZWxlbWVudC0xOS5wbmc.png",
    "https://i.pinimg.com/originals/d4/73/f3/d473f390ed78cc845580d8f4911cac3a.jpg",
    "https://i.pinimg.com/736x/29/16/d0/2916d01b37ff2c6b1b4865db785b7ced.jpg",
    "https://e7.pngegg.com/pngimages/598/62/png-clipart-face-smiley-happiness-faces-image-file-formats-photography.png",
    "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwMzQtZWxlbWVudC0wNy00MDMucG5n.png",
    "https://e7.pngegg.com/pngimages/942/789/png-clipart-adobe-creative-cloud-adobe-bridge-face-gimp-recruiter-face-photography.png",
  ];

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Logout",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Are you sure you want to Logout?",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blueAccent, textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              ),
              child: Text("no"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent, textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              ),
              child: Text("yes"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                const snackBar = SnackBar(
                  content: Text("You are Successfully Signed Out"),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                // Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Text('Connexify', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: Colors.white,
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              _showSignOutDialog(); // Call method to show sign-out dialog
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ranjeet kumar"),
              accountEmail: Text("ranjeet@example.com"),
              currentAccountPicture: GestureDetector(
                onTap: _showChangePictureDialog,
                child: CircleAvatar(
                  backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
                  child: imageFile == null
                      ? Icon(
                    Icons.person,
                    size: 30,
                  )
                      : null,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                // Handle profile tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompleteProfile()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                // Handle settings tap
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                _showSignOutDialog();
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: arrNames.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(images[index % images.length]),
                ),
              ),
              title: Row(
                children: [
                  Text(arrNames[index]),
                  SizedBox(width: 16),
                  Text(
                    times[index],
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              subtitle: Text(subtitles[index]),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      name: arrNames[index],
                      message: subtitles[index],
                      imageUrl: images[index % images.length],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.search),
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

    );
  }
}

