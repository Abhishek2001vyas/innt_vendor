import 'dart:convert';

/// result : "true"
/// message : "Color list get successfully"
/// data : {"_id":"65cdb60f878f4855d20f9303","catetoryId":"65cdaeda8e0393659722ac96","color":["pink","blue","yellow","red","sky","white","black"],"__v":6}

Prodcolor prodcolorFromJson(String str) => Prodcolor.fromJson(json.decode(str));

String prodcolorToJson(Prodcolor data) => json.encode(data.toJson());

class Prodcolor {
  Prodcolor({
    String? result,
    String? message,
    Data? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  Prodcolor.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _result;
  String? _message;
  Data? _data;

  Prodcolor copyWith({
    String? result,
    String? message,
    Data? data,
  }) =>
      Prodcolor(
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

/// _id : "65cdb60f878f4855d20f9303"
/// catetoryId : "65cdaeda8e0393659722ac96"
/// color : ["pink","blue","yellow","red","sky","white","black"]
/// __v : 6

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? catetoryId,
    List<String>? color,
    num? v,
  }) {
    _id = id;
    _catetoryId = catetoryId;
    _color = color;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _catetoryId = json['catetoryId'];
    _color = json['color'] != null ? json['color'].cast<String>() : [];
    _v = json['__v'];
  }

  String? _id;
  String? _catetoryId;
  List<String>? _color;
  num? _v;

  Data copyWith({
    String? id,
    String? catetoryId,
    List<String>? color,
    num? v,
  }) =>
      Data(
        id: id ?? _id,
        catetoryId: catetoryId ?? _catetoryId,
        color: color ?? _color,
        v: v ?? _v,
      );

  String? get id => _id;

  String? get catetoryId => _catetoryId;

  List<String>? get color => _color;

  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['catetoryId'] = _catetoryId;
    map['color'] = _color;
    map['__v'] = _v;
    return map;
  }
}
