import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton
        (onPressed: () {},
        backgroundColor: Colors.greenAccent[700],
        child: Icon(Icons.add_call),
      ),
      body: ListView(
        children: [
          callCard("Sony",Icons.call_made,Colors.green,"(2)Today,06:45pm"),
          callCard("Doremon",Icons.call_missed,Colors.red,"(10)Today,10:42am"),
          callCard("Nobita",Icons.call_received,Colors.red,"Today,06:45am"),
          callCard("Suzuka",Icons.call_made,Colors.green,"(2)Yesterday,08:45pm"),
          callCard("Zion",Icons.call_missed,Colors.red,"Yesterday,09:45am"),
        ],
      ),
    );
  }
  Widget callCard(String name,IconData iconData,Color iconColor,String time)
  {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 26,
      ),
      title: Text(name,
        style: TextStyle(
            fontWeight: FontWeight.w500),),
      subtitle: Row(
        children: [
          Icon(
            iconData,
            color: iconColor,
              size: 20,
          ),
          SizedBox(
            width: 6,
          ),
          Text(time,
            style: TextStyle(
                fontSize: 13),),
        ],
      ),
      trailing: Icon(Icons.call,size: 26,color: Colors.teal,),
    );
  }
}
