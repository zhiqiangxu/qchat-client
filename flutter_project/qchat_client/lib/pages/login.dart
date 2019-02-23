import 'package:flutter/material.dart';
import '../qrpc_client.dart';
import 'dart:convert';

const login_title = "qchat login page";

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  
  String loginStatus;

  _LoginPageState() {
    loginStatus = "";
  }

  void onPressed(String token) async {
    var socketAddr = QrpcClient.getSocketAddr(token);
    var parts = socketAddr.split(":");
    var addr = parts[0];
    var port = int.parse(parts[1]);
    var ok = await qrpcClient.connect(addr, port);
    if (!ok) {
      setState(() {
        loginStatus = "connect failed";  
      });
      return;
    }

    try {
      var result = await qrpcClient.request(CmdLogin, 0, {"app":"app", "device":"fuchsia", "token":token});
      var resultStr = utf8.decode(result.payload);
      var obj = json.decode(resultStr);
      print(obj);
      setState(() {
        loginStatus = resultStr;  
      });
    } catch (e) {
      setState(() {
        loginStatus = e.toString();  
      });
    }
    


  }

  @override
  Widget build(BuildContext context) {
    print(this.loginStatus);
    print(loginStatus!=null);  
    TextEditingController uidController = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(login_title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: uidController,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "token",
            ),
          ),
          RaisedButton(
            child: Text("登陆"),
            onPressed: () {
              onPressed(uidController.text);
            },
          ),
          Text(loginStatus)
        ],
        ),
    );
  }
}