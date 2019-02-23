import 'package:qrpc_client/qrpc_client.dart';
import 'event_bus.dart';
import 'dart:convert';

class QrpcClient {
  static String getSocketAddr(String uid) {
    return "localhost:8888";
  }

  QrpcConnection _qrpcConn;
  bool _isConnected;


  QrpcClient._internal();


  static QrpcClient _singleton = new QrpcClient._internal();

  //工厂构造函数
  factory QrpcClient()=> _singleton;

  Future<bool> connect(String addr, int port) async {
    
    if (_qrpcConn != null) {
      close(); 
    }
    _qrpcConn = new QrpcConnection(addr: addr, port: port, conf: QrpcConnectionConfig(), sub: _sub, closecb: _closecb);
    _isConnected = await _qrpcConn.connect();

    return _isConnected;
  }

  void close() {
    _qrpcConn.close();
    _qrpcConn = null;
  }

  void _sub(QrpcConnection conn, QrpcFrame frame) {
    bus.emit("qrpc_pushed", frame);
  }

  void _closecb(QrpcConnection conn) {
    _isConnected = false;

    bus.emit("qrpc_closed");
  }

  Future<QrpcFrame> request(int cmd, int flags, dynamic param) async {
    var str = json.encode(param);
    var payload = utf8.encode(str);
    return await _qrpcConn.request(cmd, flags, payload);
  }
}


QrpcClient qrpcClient = new QrpcClient();

const CmdLogin = 0;