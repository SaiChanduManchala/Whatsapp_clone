import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key,required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          leadingWidth: 60,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                  child: SvgPicture.asset(
                    widget.chatModel.isGroup
                        ? "assets/person1.svg"
                        : "assets/person1.svg",
                    height: 24,
                    width: 24,
                  ),
                  radius: 16,
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
          ),
          title: Container(
            margin: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ), // TextStyle
                ), // Text
                Text(
                  "last seen today at 12:05pm",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  const PopupMenuItem(
                    child: Text("View Contact"),
                    value: "View Contact",
                  ),
                  const PopupMenuItem(
                    child: Text("Media,Links,and docs"),
                    value: "Media,Links,and docs",
                  ),
                  const PopupMenuItem(
                    child: Text("Whatsapp web"),
                    value: "Whatsapp web",
                  ),
                  const PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  const PopupMenuItem(
                    child: Text("Mute Notifications"),
                    value: "Mute Notifications",
                  ),
                  const PopupMenuItem(
                    child: Text("Wallpaper"),
                    value: "Wallpaper",
                  ),
                ];
              },
            ),
          ]
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          margin: EdgeInsets.only(left: 2, right: 1, bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type a message",
                              prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.emoji_emotions,
                                  color: Color(0xFF075E54),
                                ),
                                onPressed: () {},
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.attach_file,
                                      color: Color(0xFF075E54),
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) =>
                                              bottomsheet());
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.camera_alt,
                                      color: Color(0xFF075E54),
                                    ),
                                    onPressed: () {},
                                  ), // IconButton
                                ],
                              ),
                              contentPadding: EdgeInsets.all(5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8, right: 5, left: 2),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFF128C7E),
                          child: IconButton(
                            icon: Icon(Icons.mic,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
    Widget bottomsheet() {
      return Container(
        height: 278,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Card(
          margin: EdgeInsets.all(18),
          child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      Icons.insert_photo, Colors.purple, "Gallery"),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      Icons.person, Colors.blue, "Contact"),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
        ),
      );
    }
    Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
        child:Column(
      children: [
        CircleAvatar(
          radius: 30,
         backgroundColor: color,
         child: Icon(
        icon,
           size: 29,
           color: Colors.white,
        ),
      ),
        SizedBox(
          height: 5,
        ),
        Text(text,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
      ),
    );
    }
}


