import 'dart:convert';

/// result : "true"
/// message : "Size list get successfully"
/// data : {"_id":"65cdb57c878f4855d20f92ea","catetoryId":"65cdaeda8e0393659722ac96","size_name":["s","m","l","xl","xxl","xxxl","26","28","30","32","34","36"],"__v":11}

Prodsize prodsizeFromJson(String str) => Prodsize.fromJson(json.decode(str));

String prodsizeToJson(Prodsize data) => json.encode(data.toJson());

class Prodsize {
  Prodsize({
    String? result,
    String? message,
    Data? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  Prodsize.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _result;
  String? _message;
  Data? _data;

  Prodsize copyWith({
    String? result,
    String? message,
    Data? data,
  }) =>
      Prodsize(
        result: result ?? _result,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get result => _result;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// _id : "65cdb57c878f4855d20f92ea"
/// catetoryId : "65cdaeda8e0393659722ac96"
/// size_name : ["s","m","l","xl","xxl","xxxl","26","28","30","32","34","36"]
/// __v : 11

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? catetoryId,
    List<String>? sizeName,
    num? v,
  }) {
    _id = id;
    _catetoryId = catetoryId;
    _sizeName = sizeName;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _catetoryId = json['catetoryId'];
    _sizeName =
        json['size_name'] != null ? json['size_name'].cast<String>() : [];
    _v = json['__v'];
  }

  String? _id;
  String? _catetoryId;
  List<String>? _sizeName;
  num? _v;

  Data copyWith({
    String? id,
    String? catetoryId,
    List<String>? sizeName,
    num? v,
  }) =>
      Data(
        id: id ?? _id,
        catetoryId: catetoryId ?? _catetoryId,
        sizeName: sizeName ?? _sizeName,
        v: v ?? _v,
      );

  String? get id => _id;

  String? get catetoryId => _catetoryId;

  List<String>? get sizeName => _sizeName;

  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['catetoryId'] = _catetoryId;
    map['size_name'] = _sizeName;
    map['__v'] = _v;
    return map;
  }
}
