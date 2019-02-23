import 'package:flutter/material.dart';
import '../io.dart';
import '../model/event_bus.dart';
import 'login.dart';

class ThreadsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ThreadsPageState();
}

class _ThreadsPageState extends State<ThreadsPage> {

  //下划线widget预定义以供复用。  
  static const Widget divider1=Divider(color: Colors.blue,);
  static const Widget divider2=Divider(color: Colors.green);

  @override
  void initState() {
    super.initState();

    bus.on("qrpc_closed", (_){
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    });
    bus.on("qrpc_pushed", (frame) {
      setState(() {
        print('Got frame, refresh gui');
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    
    int itemCount = loginResponse != null ? 
          loginResponse.csOfflineThreads?.length + loginResponse.offlineThreads.threads?.length
          : 0;
    return ListView.separated(
      reverse: true,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        print(index);
        return Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: SizedBox(
                  width: 24.0,
                  height: 24.0, 
                  child: CircularProgressIndicator(strokeWidth: 2.0)
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return index%2==0?divider1:divider2;
      }
    );
  }

}