import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF128C7E),
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Contact",
                 style: TextStyle( fontSize: 19,
                   fontWeight: FontWeight.bold,
                 ),
              ),
            Text(
              "256 contacts",
              style: TextStyle( fontSize: 13,
              ),
            ),
          ],
          ),
          actions: [
            IconButton(
               icon: Icon(
                 Icons.search, size: 26,),
         onPressed: () {}),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text("Invite a friend"),
                    value: "Invite a friend",
                  ),
                  const PopupMenuItem(
                    child: Text("Contacts"),
                    value: "Contacts",
                  ),
                  const PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  const PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),
                ];
              },
            ),
    ],
        ),
    );
  }
}

