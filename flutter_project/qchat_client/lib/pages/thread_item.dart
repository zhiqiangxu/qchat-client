import 'package:flutter/material.dart';
import 'package:qchat_client/thread_and_msg.dart';

class ThreadItem  extends StatelessWidget {
  final Thread thread;

  ThreadItem({this.thread});
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(thread.peerThreadID),),
          ),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(thread.snapMsg.fromUID),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(thread.snapMsg.content),
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}