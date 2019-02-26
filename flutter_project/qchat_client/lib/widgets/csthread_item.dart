import 'package:flutter/material.dart';
import 'package:qchat_client/thread_and_msg.dart';
import 'package:qchat_client/pages/chat.dart';

class CSThreadItem  extends StatelessWidget {
  final CSThread csthread;

  CSThreadItem({this.csthread});
  
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        child: new Row(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(csthread.peer.id()),),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(csthread.snapMsg.fromUID),
                  new Text(csthread.csid),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(csthread.snapMsg.content),
                  )
                ]
              ),
            )
          ],
        ),
    ),
    onTap: () {
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return ChatPage(csthread:csthread);
      }));
    },
    );
  }
}