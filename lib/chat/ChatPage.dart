import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String name;
  final String message;
  final String imageUrl;

  ChatPage({required this.name, required this.message, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 16,color: Colors.white)),
                Text('Online', style: TextStyle(fontSize: 12,color: Colors.white)),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.teal.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.videocam_outlined,color: Colors.white,),
            onPressed: () {
              // Implement video call action
            },
          ),
          IconButton(
            icon: Icon(Icons.call_outlined,color: Colors.white,),
            onPressed: () {
              // Implement call action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert,color: Colors.white,),
            onPressed: () {
              // Implement more actions
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              // Add chat messages or other content here
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.teal.shade700),
                  onPressed: () {
                    // Implement camera action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.teal.shade700),
                  onPressed: () {
                    // Implement attachment action
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.teal.shade700),
                  onPressed: () {
                    // Implement send action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
