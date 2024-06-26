import 'package:flutter/material.dart';

class Messagepage extends StatefulWidget {
  const Messagepage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Messagepage> createState() => _MessagepageState();
}

class _MessagepageState extends State<Messagepage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade700, // Change the app bar color to teal
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
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
            ),
          );
        },
      ),
    );
  }

}
