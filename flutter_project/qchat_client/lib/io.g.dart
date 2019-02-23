// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'io.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse()
    ..loginInfo = json['login_info'] == null
        ? null
        : LoginInfo.fromJson(json['login_info'] as Map<String, dynamic>)
    ..offlineThreads = json['offline_threads'] == null
        ? null
        : OfflineThreadsResult.fromJson(
            json['offline_threads'] as Map<String, dynamic>)
    ..csOfflineThreads = (json['cs_offline_threads'] as List)
        ?.map((e) =>
            e == null ? null : CSThread.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..csStatus = json['cs_status'] as int;
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'login_info': instance.loginInfo,
      'offline_threads': instance.offlineThreads,
      'cs_offline_threads': instance.csOfflineThreads,
      'cs_status': instance.csStatus
    };

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) {
  return LoginInfo(
      uid: json['uid'] as String,
      maxServe: json['max_serve'] as int,
      csids: (json['csids'] as Map<String, dynamic>)
          ?.map((k, e) => MapEntry(k, e as Map<String, dynamic>)));
}

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'uid': instance.uid,
      'max_serve': instance.maxServe,
      'csids': instance.csids
    };

OfflineThreadsResult _$OfflineThreadsResultFromJson(Map<String, dynamic> json) {
  return OfflineThreadsResult()
    ..threads = (json['threads'] as List)
        ?.map((e) =>
            e == null ? null : Thread.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OfflineThreadsResultToJson(
        OfflineThreadsResult instance) =>
    <String, dynamic>{'threads': instance.threads};
