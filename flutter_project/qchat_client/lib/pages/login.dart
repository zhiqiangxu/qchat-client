import 'package:flutter/material.dart';
import '../qrpc_client.dart';
import '../io.dart';
import '../event_bus.dart';
import 'threads.dart';
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

  void onPressed(BuildContext context, String token) async {
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
      var resultObj = json.decode(resultStr);
      
      var resp = LoginResponse.fromJson(resultObj);
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return ThreadsPage();
      }));

      bus.on("qrpc_pushed", (frame) {
        loginResponse?.onPush(frame);
      });
      bus.on("qrpc_closed", (_) {
        loginResponse = null;
      });
      setState(() {
        loginStatus = 'resultStr $resultStr resp ${json.encode(resp.toJson())}';  
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
              onPressed(context, uidController.text);
            },
          ),
          Text(loginStatus)
        ],
        ),
    );
  }
}