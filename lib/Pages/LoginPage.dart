import 'package:flutter/material.dart';
import 'package:whatsapp_clone/NewScreen/OtpScreen.dart';

import '../NewScreen/CountryModel.dart';
import '../NewScreen/CountryPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  String countryname = "India";
  String countrycode = "+91";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Enter your phone number", style: TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        wordSpacing: 1,
      ),
      ),
      centerTitle: true,
      actions: [
        Icon(Icons.more_vert,
          color: Colors.black,
        ),
      ],
    ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(children: [
          Text(
            "Whatsapp will send an sms message to verify your number",
            style: TextStyle(fontSize: 13.5,
            ), // Textstyle
          ), // Text
          SizedBox(
            height: 5,
          ), // SizedBox
          Text(
            "What's my number?",
            style: TextStyle(fontSize: 12.8, color: Colors.cyan[800]),
          ), // Text
          SizedBox(
            height: 15,
          ), // SizedBox
          countryCard(),
          SizedBox(
            height: 5,
          ),
          number(),
          Expanded(child: Container()),
          InkWell(
            onTap:() {
              if(_controller.text.length>=10)
                {
                  showMydialogue1();
                }
              else
                {
                  showMydialogue();
                }
            },
          child: Container(
            color: Colors.tealAccent,
            height: 35,
            width: 70,
            child: Center(
              child: Text(
                "NEXT",
                style:TextStyle(
                  fontWeight: FontWeight.w600),
                ),
              ),
          ),
      ),
          SizedBox(height: 40),
        ],

        ),
      ),
    ); // Scaffold
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(
            builder: (builder) => CountryPage(setCountryData: setCountryData)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(border: Border(
          bottom: BorderSide(
            color: Colors.teal, width: 1.8,
          ),
        ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Center(child: Text(
                  countryname,
                  style: TextStyle(fontSize: 16),
                ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  Widget number() {
    return Container(width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [ Container(
          width: 70,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.teal,
                width: 1.8,
              ), // BorderSide
            ), // Border
          ), // BoxDecoration
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
              "+",
              style: TextStyle(fontSize: 18),
            ), // Text
            SizedBox(
              width: 15,), // SizedBox
            Text(
              countrycode.substring(1),
              style: TextStyle(fontSize: 15),
            ),
          ],
          ),
        ),
          SizedBox(
            width: 30,
          ), // SizedBox
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.6,
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width / 1.5 - 100,
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  hintText: "phone number"),
            ),
          ),
        ],
      ),
    );
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryname = countryModel.name;
      countrycode = countryModel.code;
    });

    Navigator.pop(context);
  }

  Future<void> showMydialogue()
  {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("There is no number you entered",
               style: TextStyle(fontSize: 14),
             ),
           ],
         ),
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Ok"))],
      );
    });
  }
  Future<void> showMydialogue1() {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("We will be verifying your number",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                countrycode + " " + _controller.text,
                style: TextStyle(fontSize: 14),
              ),
              Text("Is this OK, or would you like to edit the number?",
                style: TextStyle(fontSize: 13.5),),
            ],
          ),
        ),
        actions: [
          TextButton(
            child:
            Text("Edit",
              style: TextStyle(
                  fontSize: 14,color: Colors.teal),
      ),
            onPressed: () {},
        ),
          TextButton(
            child:
            Text("OK",
              style: TextStyle(
                  fontSize: 14,color: Colors.teal),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(
                  builder: (builder) => OtpScreen(
                    number: _controller.text,
                    countryCode: countrycode,),),);
            },
          ),
        ],
      );
    });
  }
}
