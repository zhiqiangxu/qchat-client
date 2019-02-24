import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qchat_client/thread_and_msg.dart';
import 'package:qchat_client/widgets/msg_item.dart';
import 'package:qchat_client/model/qrpc_client.dart';
import 'package:qchat_client/io.dart';

class ChatPage extends StatefulWidget {

  final CSThread csthread;
  final Thread thread;
  ChatPage({Key key, this.csthread, this.thread}): super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    var param;
    var msgID = this.widget.csthread != null ? this.widget.csthread.snapMsg.msgID+1 : this.widget.thread.snapMsg.msgID+1;
    if (this.widget.csthread != null) {
      var peerUID = this.widget.csthread.snapMsg.fromCSID == "" ? this.widget.csthread.snapMsg.fromUID : this.widget.csthread.snapMsg.toUID;
      param = {"thread_info":{"csid": this.widget.csthread.csid, "peer_uid":peerUID},"from_msg_id":msgID, "max":50};
    } else {
      if (this.widget.thread.snapMsg.fromUID ==loginResponse.loginInfo.uid) {
        if (this.widget.thread.snapMsg.toCSID != "") {
          param = {"thread_info":{"uid":loginResponse.loginInfo.uid, "peer_csid":this.widget.thread.snapMsg.toCSID},"from_msg_id":msgID, "max":50};
        } else {
          param = {"thread_info":{"uid":loginResponse.loginInfo.uid, "peer_uid":this.widget.thread.snapMsg.toUID},"from_msg_id":msgID, "max":50};
        }
      } else {
        if (this.widget.thread.snapMsg.fromCSID != "") {
          param = {"thread_info":{"uid":loginResponse.loginInfo.uid, "peer_csid":this.widget.thread.snapMsg.fromCSID},"from_msg_id":msgID, "max":50};
        } else {
          param = {"thread_info":{"uid":loginResponse.loginInfo.uid, "peer_uid":this.widget.thread.snapMsg.fromUID},"from_msg_id":msgID, "max":50};
        }
      }
      
    }
    
    var result = await qrpcClient.request(8, 0, param);
    var resultStr = utf8.decode(result.payload);
    var resultObj = json.decode(resultStr);

    var resp = ThreadMsgsResponse.fromJson(resultObj);
    print('resp $resp');
    if (this.widget.thread != null) {
      this.widget.thread.threadMsgs.msgList = resp.result.msgList;
    } else {
      this.widget.csthread.threadMsgs.msgList = resp.result.msgList;
    }

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    if (this.widget.csthread != null) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("客服消息详情"),
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: new Container(
          child: new Column(children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                controller: _scrollController,
                reverse: true,
                itemCount: this.widget.csthread.threadMsgs.msgList?.length ?? 0,
                itemBuilder: (_, int index) {
                  return new MsgItem(msg:this.widget.csthread.threadMsgs.msgList[index]);
                },
              ),
            )
          ],),
        ),
      );
    } else {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("消息详情"),
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: new Container(
          child: new Column(children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                controller: _scrollController,
                reverse: true,
                itemCount: this.widget.thread.threadMsgs.msgList?.length ?? 0,
                itemBuilder: (_, int index) {
                  return new MsgItem(msg:this.widget.thread.threadMsgs.msgList[index]);
                },
              ),
            )
          ],),
        ),
      );
    }
    
  }

}