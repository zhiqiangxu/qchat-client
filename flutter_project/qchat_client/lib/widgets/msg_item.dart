import 'package:flutter/material.dart';
import 'package:qchat_client/thread_and_msg.dart';
import 'package:qchat_client/io.dart';

class MsgItem extends StatelessWidget {

final Msg msg;
MsgItem({this.msg});

@override
  Widget build(BuildContext context) {
    if (msg.fromUID == loginResponse.loginInfo.uid || loginResponse.loginInfo.csids.containsKey(msg.fromCSID)) {
      return _buildRight();
    } else {
      return _buildLeft();
    }
  }

  Widget _buildLeft() {
    return new Container(
        child: new Row(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(msg.fromUID),),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(msg.content),
                ]
              ),
            )
          ],
        ),
    );
  }

  Widget _buildRight() {
    return new Container(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(msg.content),
                ]
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(msg.fromUID),),
            ),
          ],
        ),
    );
  }
}