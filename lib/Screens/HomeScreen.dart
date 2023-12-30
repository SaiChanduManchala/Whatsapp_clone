import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Pages/StatusPage.dart';
import '../Pages/ChatPage.dart';
import 'CallScreen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin
{
  TabController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          title: Text("Whatsapp Clone"),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            PopupMenuButton<String>(
            onSelected: (value){
             print(value);
             },
            itemBuilder: (BuildContext contesxt){
                  return [
                    const PopupMenuItem(
                      child: Text("New group"),
                      value: "New group",
                    ),
                    const PopupMenuItem(
                      child: Text("New broadcast"),
                      value: "New broadcast",
                    ),
                    const PopupMenuItem(
                      child: Text("Linked devices"),
                      value: "Linked devices",
                    ),
                    const PopupMenuItem(
                      child: Text("Starred messages"),
                      value: "Starred messages",
                    ),
                    const PopupMenuItem(
                      child: Text("Payments"),
                      value: "Payments",
                    ),
                    const PopupMenuItem(
                      child: Text("Settings"),
                      value: "Settings",
                    ),
                  ];
              },
            ),
          ],
          bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: const [
            Text("Camera"),
            ChatPage(),
            StatusPage(),
            CallScreen(),
          ],
        ),
      );
  }
}
