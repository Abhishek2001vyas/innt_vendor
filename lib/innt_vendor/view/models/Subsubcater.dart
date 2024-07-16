import 'dart:convert';

/// result : "true"
/// message : "sub_subcategory data are"
/// data : [{"_id":"65d852118b14a6ede7ab2c1a","subcategoryId":"65d84405ccfafa96fa337d79","english_sub_subcategory_name":"T-shirts","french_sub_subcategory_name":"T-shirts","active_status":0,"__v":0},{"_id":"65d8524e8b14a6ede7ab2c1c","subcategoryId":"65d84405ccfafa96fa337d79","english_sub_subcategory_name":"Formal wear","french_sub_subcategory_name":"Formal wear","active_status":0,"__v":0},{"_id":"65d8525f8b14a6ede7ab2c1e","subcategoryId":"65d84405ccfafa96fa337d79","english_sub_subcategory_name":"Jeans","french_sub_subcategory_name":"Formal wear","active_status":0,"__v":0},{"_id":"65d852698b14a6ede7ab2c20","subcategoryId":"65d84405ccfafa96fa337d79","english_sub_subcategory_name":"Shoes","french_sub_subcategory_name":"Formal wear","active_status":0,"__v":0}]

Subsubcater subsubcaterFromJson(String str) =>
    Subsubcater.fromJson(json.decode(str));

String subsubcaterToJson(Subsubcater data) => json.encode(data.toJson());

class Subsubcater {
  Subsubcater({
    String? result,
    String? message,
    List<Data>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  Subsubcater.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  String? _result;
  String? _message;
  List<Data>? _data;

  Subsubcater copyWith({
    String? result,
    String? message,
    List<Data>? data,
  }) =>
      Subsubcater(
        result: result ?? _result,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get result => _result;

  String? get message => _message;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "65d852118b14a6ede7ab2c1a"
/// subcategoryId : "65d84405ccfafa96fa337d79"
/// english_sub_subcategory_name : "T-shirts"
/// french_sub_subcategory_name : "T-shirts"
/// active_status : 0
/// __v : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? subcategoryId,
    String? englishSubSubcategoryName,
    String? frenchSubSubcategoryName,
    num? activeStatus,
    num? v,
  }) {
    _id = id;
    _subcategoryId = subcategoryId;
    _englishSubSubcategoryName = englishSubSubcategoryName;
    _frenchSubSubcategoryName = frenchSubSubcategoryName;
    _activeStatus = activeStatus;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _subcategoryId = json['subcategoryId'];
    _englishSubSubcategoryName = json['english_sub_subcategory_name'];
    _frenchSubSubcategoryName = json['french_sub_subcategory_name'];
    _activeStatus = json['active_status'];
    _v = json['__v'];
  }

  String? _id;
  String? _subcategoryId;
  String? _englishSubSubcategoryName;
  String? _frenchSubSubcategoryName;
  num? _activeStatus;
  num? _v;

  Data copyWith({
    String? id,
    String? subcategoryId,
    String? englishSubSubcategoryName,
    String? frenchSubSubcategoryName,
    num? activeStatus,
    num? v,
  }) =>
      Data(
        id: id ?? _id,
        subcategoryId: subcategoryId ?? _subcategoryId,
        englishSubSubcategoryName:
            englishSubSubcategoryName ?? _englishSubSubcategoryName,
        frenchSubSubcategoryName:
            frenchSubSubcategoryName ?? _frenchSubSubcategoryName,
        activeStatus: activeStatus ?? _activeStatus,
        v: v ?? _v,
      );

  String? get id => _id;

  String? get subcategoryId => _subcategoryId;

  String? get englishSubSubcategoryName => _englishSubSubcategoryName;

  String? get frenchSubSubcategoryName => _frenchSubSubcategoryName;

  num? get activeStatus => _activeStatus;

  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['subcategoryId'] = _subcategoryId;
    map['english_sub_subcategory_name'] = _englishSubSubcategoryName;
    map['french_sub_subcategory_name'] = _frenchSubSubcategoryName;
    map['active_status'] = _activeStatus;
    map['__v'] = _v;
    return map;
  }
}
