import 'package:flutter/material.dart';

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
  }


  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
      reverse: true,
      itemCount: 1,
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