import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({Key? key,required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
    Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
      leading: CircleAvatar(
      radius: 23,
      child: SvgPicture.asset( "assets/person1.svg",
        color: Colors.white,
          height: 30,
          width: 30,
        ),
      backgroundColor: Colors.blueGrey[200],
      ),
      title: Text("Sophie",
      style: TextStyle( fontSize: 15,
       fontWeight: FontWeight.bold,
    ),
    ),
    ),
    );
  }
}
