import 'package:flutter/material.dart';

class HeadOwnStatus extends StatefulWidget {
  const HeadOwnStatus({Key? key}) : super(key: key);

  @override
  State<HeadOwnStatus> createState() => _HeadOwnStatusState();
}

class _HeadOwnStatusState extends State<HeadOwnStatus> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
        const CircleAvatar(
        radius: 27,
        backgroundColor: Colors.grey,
        backgroundImage: AssetImage("assets/doremon.jpg"),
      ),
      Positioned(
      bottom: 0,
      right: 0,
    child: CircleAvatar(
      backgroundColor: Colors.greenAccent[700],
      radius: 10,
      child: Icon( Icons.add,
        size: 20,
       color: Colors.white,
      ),
    ),
    ),
    ],
    ),
    title: Text("My status",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black
    ),
    ),
      subtitle: Text(
        "Tap to add status update",
        style: TextStyle(fontSize: 13,color: Colors.grey[900]),
      ),
    );
  }
}
