import 'package:json_annotation/json_annotation.dart';
import 'thread_and_msg.dart';

part 'io.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginResponse {
  LoginInfo loginInfo;
  OfflineThreadsResult offlineThreads;
  List<CSThread> csOfflineThreads;
  int csStatus;

  LoginResponse();

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

LoginResponse login;

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