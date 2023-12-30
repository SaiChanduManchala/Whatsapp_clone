import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/CustomCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/SelectContact.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);
  @override
  State<ChatPage> createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats=[
    ChatModel(
      name: "Bheem",
      isGroup: false,
      currentMessage: "Laddo..",
      time: "04:00pm",
      icon: "person1.svg",
    ),
    ChatModel(
      name: "Zion",
      isGroup: false,
      currentMessage: "singing??",
      time: "12:32pm",
      icon: "person1.svg",
    ),
    ChatModel(
      name: "Doremon",
      isGroup: false,
      currentMessage: "Ready for adventure",
      time: "09:35am",
      icon: "person1.svg",
    ),
    ChatModel(
      name: "Sophie",
      isGroup: false,
      currentMessage: "Hi",
      time: "04:00am",
      icon: "person1.svg",
    ),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (builder) => SelectContact()));
        }  ,
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (contex, index) => CustomCard(
            chatModel: chats[index]),
      ),
      );
  }
}
