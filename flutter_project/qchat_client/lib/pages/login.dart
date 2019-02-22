import 'package:flutter/material.dart';

const login_title = "qchat login page";

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(login_title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: "uid",
            ),
          ),
          RaisedButton(
            child: Text("登陆"),
            onPressed: ()=>{},
          )
        ],
        ),
    );
  }
}