import 'package:flutter/material.dart';
import 'package:qchat_client/io.dart';
import 'package:qchat_client/model/event_bus.dart';
import 'package:qchat_client/pages/login.dart';
import 'package:qchat_client/pages/thread_item.dart';
import 'package:qchat_client/pages/csthread_item.dart';

class ThreadsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ThreadsPageState();
}

class _ThreadsPageState extends State<ThreadsPage> {

  //下划线widget预定义以供复用。  
  static const Widget _divider1=Divider(color: Colors.blue,);
  static const Widget _divider2=Divider(color: Colors.green);

  ScrollController _scrollController = new ScrollController();

  EventCallback on_close;
  EventCallback on_pushed;

  @override
  void initState() {
    super.initState();

    on_close = (_){
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    };
    on_pushed = (frame) {
      setState(() {
        print('Got frame, refresh gui');
      });
    };
    bus.on("qrpc_closed", on_close);
    bus.on("qrpc_pushed", on_pushed);
  }

  @override
  void dispose() {
    super.dispose();

    bus.off("qrpc_closed", on_close);
    bus.off("qrpc_pushed", on_pushed);
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("消息列表"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.exit_to_app),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            },
          )
        ],
      ),
      body: new Container(
        child: new Column(children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              controller: _scrollController,
              reverse: true,
              itemCount: loginResponse.csOfflineThreads?.length ?? 0,
              itemBuilder: (_, int index) {
                return new CSThreadItem(csthread:loginResponse.csOfflineThreads[index]);
              },
            ),
          ),
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              controller: _scrollController,
              reverse: true,
              itemCount: loginResponse.offlineThreads.threads?.length ?? 0,
              itemBuilder: (_, int index) {
                return new ThreadItem(thread:loginResponse.offlineThreads.threads[index]);
              },
            ),
          )
        ],),
      ),
    );
  }

}