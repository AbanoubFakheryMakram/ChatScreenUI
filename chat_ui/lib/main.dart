import 'package:chat_ui/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myID = 123;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.arrow_back_ios, color: Colors.black,),
            title: Text('Username', style: TextStyle(color: Colors.black),),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              addAutomaticKeepAlives: true,
              reverse: true,
              itemCount: messaesList.length,
              itemBuilder: (_, index) {
                Messages message = messaesList[index];
                bool isMe = message.senderID == myID;
                return buildMessage(message, isMe);
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.insert_emoticon,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                      child: TextField(
                    onChanged: (message) {},
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'type your message here'),
                  )),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMessage(Messages message, bool isMe) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * .75,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          margin: isMe
              ? EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 4)
              : EdgeInsets.only(left: 80, top: 8, bottom: 8, right: 4),
          decoration: BoxDecoration(
              color:
                  isMe ? Color(0xff6D90FF) : Color(0xff6D00FF).withOpacity(.2),
              borderRadius: isMe
                  ? BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(30),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              isMe
                  ? Text('you',
                      style: TextStyle(color: Colors.black, fontSize: 11))
                  : SizedBox.shrink(),
              Text(
                message.message,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.indigo, fontSize: 15),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(message.date,
                    style: TextStyle(color: Colors.black, fontSize: 10)),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Messages {
  var senderID;
  var reciverID;
  var message;
  var date;
  bool isLiked;

  Messages(
      {this.date, this.message, this.reciverID, this.senderID, this.isLiked});
}

List<Messages> messaesList = [
  Messages(
      message: 'Hellow ya..',
      date: '10.5 AM',
      reciverID: 542,
      senderID: 123,
      isLiked: true),
  Messages(
      message: 'how are you..',
      date: '10.8 AM',
      reciverID: 123,
      senderID: 524,
      isLiked: false),
  Messages(
      message:
          'miss you so musch hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
      date: '10.8 AM',
      isLiked: false,
      reciverID: 123,
      senderID: 524),
  Messages(message: 'me too', date: '10.10 AM', reciverID: 542, senderID: 123),
  Messages(
      message: 'can we meet?!',
      date: '10.12 AM',
      isLiked: false,
      reciverID: 542,
      senderID: 123),
  Messages(message: 'hhhhh', date: '10.15 AM', reciverID: 123, senderID: 542),
  Messages(
      message: 'of course babay',
      date: '10.16 AM',
      isLiked: false,
      reciverID: 123,
      senderID: 542),
  Messages(
      message: 'love you so musch',
      date: '10.19 AM',
      reciverID: 542,
      senderID: 123,
      isLiked: true),
  Messages(
      message: 'me too babay',
      date: '10.21 AM',
      reciverID: 123,
      senderID: 542,
      isLiked: false),
];
