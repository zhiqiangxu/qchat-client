// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_and_msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thread _$ThreadFromJson(Map<String, dynamic> json) {
  return Thread()
    ..peer = json['peer'] == null
        ? null
        : Peer.fromJson(json['peer'] as Map<String, dynamic>)
    ..threadMsgs = json['thread_msgs'] == null
        ? null
        : ThreadMsgs.fromJson(json['thread_msgs'] as Map<String, dynamic>)
    ..msgFetched = json['msg_fetched'] as bool
    ..snapMsg = json['snap_msg'] == null
        ? null
        : Msg.fromJson(json['snap_msg'] as Map<String, dynamic>)
    ..lastUpdate = json['last_update'] as int;
}

Map<String, dynamic> _$ThreadToJson(Thread instance) => <String, dynamic>{
      'peer': instance.peer,
      'thread_msgs': instance.threadMsgs,
      'msg_fetched': instance.msgFetched,
      'snap_msg': instance.snapMsg,
      'last_update': instance.lastUpdate
    };

Peer _$PeerFromJson(Map<String, dynamic> json) {
  return Peer()
    ..uid = json['uid'] as String
    ..csid = json['csid'] as String
    ..groupID = json['group_i_d'] as String;
}

Map<String, dynamic> _$PeerToJson(Peer instance) => <String, dynamic>{
      'uid': instance.uid,
      'csid': instance.csid,
      'group_i_d': instance.groupID
    };

CSThread _$CSThreadFromJson(Map<String, dynamic> json) {
  return CSThread()
    ..peer = json['peer'] == null
        ? null
        : Peer.fromJson(json['peer'] as Map<String, dynamic>)
    ..threadMsgs = json['thread_msgs'] == null
        ? null
        : ThreadMsgs.fromJson(json['thread_msgs'] as Map<String, dynamic>)
    ..msgFetched = json['msg_fetched'] as bool
    ..snapMsg = json['snap_msg'] == null
        ? null
        : Msg.fromJson(json['snap_msg'] as Map<String, dynamic>)
    ..lastUpdate = json['last_update'] as int
    ..switchInTime = json['switch_in_time'] as int
    ..csid = json['csid'] as String;
}

Map<String, dynamic> _$CSThreadToJson(CSThread instance) => <String, dynamic>{
      'peer': instance.peer,
      'thread_msgs': instance.threadMsgs,
      'msg_fetched': instance.msgFetched,
      'snap_msg': instance.snapMsg,
      'last_update': instance.lastUpdate,
      'switch_in_time': instance.switchInTime,
      'csid': instance.csid
    };

ThreadMsgs _$ThreadMsgsFromJson(Map<String, dynamic> json) {
  return ThreadMsgs()
    ..msgList = (json['msg_list'] as List)
        ?.map((e) => e == null ? null : Msg.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..end = json['end'] as bool
    ..fetchHist = json['fetch_hist'] as bool;
}

Map<String, dynamic> _$ThreadMsgsToJson(ThreadMsgs instance) =>
    <String, dynamic>{
      'msg_list': instance.msgList,
      'end': instance.end,
      'fetch_hist': instance.fetchHist
    };

Msg _$MsgFromJson(Map<String, dynamic> json) {
  return Msg()
    ..created = json['created'] as int
    ..auto = json['auto'] as bool
    ..msgID = json['msg_id'] as int
    ..app = json['app'] as String
    ..device = json['device'] as String
    ..fromUID = json['from_uid'] as String
    ..fromCSID = json['from_csid'] as String
    ..toUID = json['to_uid'] as String
    ..toCSID = json['to_csid'] as String
    ..groupID = json['group_id'] as String
    ..clientMsgID = json['client_msg_id'] as int
    ..content = json['content'] as String;
}

Map<String, dynamic> _$MsgToJson(Msg instance) => <String, dynamic>{
      'created': instance.created,
      'auto': instance.auto,
      'msg_id': instance.msgID,
      'app': instance.app,
      'device': instance.device,
      'from_uid': instance.fromUID,
      'from_csid': instance.fromCSID,
      'to_uid': instance.toUID,
      'to_csid': instance.toCSID,
      'group_id': instance.groupID,
      'client_msg_id': instance.clientMsgID,
      'content': instance.content
    };
