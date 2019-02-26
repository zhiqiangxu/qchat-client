import 'package:json_annotation/json_annotation.dart';

part 'thread_and_msg.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Thread {
  Peer peer;
  ThreadMsgs threadMsgs;
  bool msgFetched;
  Msg snapMsg;
  int lastUpdate;

  Thread();

  factory Thread.fromJson(Map<String, dynamic> json) => _$ThreadFromJson(json);
  Map<String, dynamic> toJson() => _$ThreadToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Peer {
  String uid;
  String csid;
  String groupID;

  Peer();

  String id() {
    if (uid!="") return uid;
    if (csid!="") return "cs:$csid";
    return 'g:$groupID';
  }
  factory Peer.fromJson(Map<String, dynamic> json) => _$PeerFromJson(json);
  Map<String, dynamic> toJson() => _$PeerToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CSThread extends Thread {
  int switchInTime;
  String csid;

  CSThread();

  factory CSThread.fromJson(Map<String, dynamic> json) => _$CSThreadFromJson(json);
  Map<String, dynamic> toJson() => _$CSThreadToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ThreadMsgs {
  List<Msg> msgList;
  bool end;
  bool fetchHist;

  ThreadMsgs();

  factory ThreadMsgs.fromJson(Map<String, dynamic> json) => _$ThreadMsgsFromJson(json);
  Map<String, dynamic> toJson() => _$ThreadMsgsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Msg {
  int created;
  bool auto;
  @JsonKey(name: "msg_id")
  int msgID;
  String app;
  String device;
  @JsonKey(name: "from_uid")
  String fromUID;
  @JsonKey(name: "from_csid")
  String fromCSID;
  @JsonKey(name: "to_uid")
  String toUID;
  @JsonKey(name: "to_csid")
  String toCSID;
  @JsonKey(name: "group_id")
  String groupID;
  @JsonKey(name: "client_msg_id")
  int clientMsgID;
  String content;

  Msg();

  factory Msg.fromJson(Map<String, dynamic> json) => _$MsgFromJson(json);
  Map<String, dynamic> toJson() => _$MsgToJson(this);
}