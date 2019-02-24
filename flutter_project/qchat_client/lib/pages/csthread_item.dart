import 'package:flutter/material.dart';
import 'package:qchat_client/thread_and_msg.dart';

class CSThreadItem  extends StatelessWidget {
  final CSThread csthread;

  CSThreadItem({this.csthread});
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(csthread.peerThreadID),),
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
    );
  }
}