import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。  
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);

    return ListView.separated(
      reverse: true,
      itemCount: null,
      itemBuilder: (context, index) {
        print(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return index%2==0?divider1:divider2;
      }
    );
  }

}