import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:qchat_client/thread_and_msg.dart';
import 'package:qrpc_client/qrpc_client.dart';

part 'io.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginResponse {
  LoginInfo loginInfo;
  OfflineThreadsResult offlineThreads;
  List<CSThread> csOfflineThreads;
  int csStatus;

  LoginResponse();

  void onPush(QrpcFrame frame) {
    print('frame $frame');
    var resultStr = utf8.decode(frame.payload);
    var resultObj = json.decode(resultStr);
    var data = NotifyData.fromJson(resultObj);
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

// NotifyData for pushed frame
@JsonSerializable(fieldRename: FieldRename.snake)
class NotifyData {
	int  type;
	String data;

  NotifyData();

  factory NotifyData.fromJson(Map<String, dynamic> json) => _$NotifyDataFromJson(json);
  Map<String, dynamic> toJson() => _$NotifyDataToJson(this);
}
LoginResponse loginResponse;

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginInfo {
  
  String uid;
  int maxServe;
  Map<String, Map<String,dynamic>> csids;

  LoginInfo({this.uid, this.maxServe, this.csids});

  factory LoginInfo.fromJson(Map<String, dynamic> json) => _$LoginInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OfflineThreadsResult {
  List<Thread> threads;

  OfflineThreadsResult();

  factory OfflineThreadsResult.fromJson(Map<String, dynamic> json) => _$OfflineThreadsResultFromJson(json);
  Map<String, dynamic> toJson() => _$OfflineThreadsResultToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ThreadMsgsResponse {

  ThreadMsgs result;

  ThreadMsgsResponse();


  factory ThreadMsgsResponse.fromJson(Map<String, dynamic> json) => _$ThreadMsgsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ThreadMsgsResponseToJson(this);
}