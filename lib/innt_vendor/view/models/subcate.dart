import 'dart:convert';

/// result : "true"
/// message : "subcategory list are"
/// data : [{"subcategoryId":"65d84405ccfafa96fa337d79","english_subcategory_name":"Mens","french_subcategory_name":"Pour des hommes","subcategory_image":"images (5).jpg"},{"subcategoryId":"65d845f0ccfafa96fa337d9a","english_subcategory_name":"Womens","french_subcategory_name":"Aux femmes","subcategory_image":"images (6).jpg"},{"subcategoryId":"65d8466fccfafa96fa337da8","english_subcategory_name":"Kids","french_subcategory_name":"Enfants","subcategory_image":"images (7).jpg"},{"subcategoryId":"65d846daccfafa96fa337db4","english_subcategory_name":"Footwear","french_subcategory_name":"Chaussure","subcategory_image":"images (8).jpg"}]

Subcate subcateFromJson(String str) => Subcate.fromJson(json.decode(str));

String subcateToJson(Subcate data) => json.encode(data.toJson());

class Subcate {
  Subcate({
    String? result,
    String? message,
    List<Data>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  Subcate.fromJson(dynamic json) {
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

  Subcate copyWith({
    String? result,
    String? message,
    List<Data>? data,
  }) =>
      Subcate(
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

/// subcategoryId : "65d84405ccfafa96fa337d79"
/// english_subcategory_name : "Mens"
/// french_subcategory_name : "Pour des hommes"
/// subcategory_image : "images (5).jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? subcategoryId,
    String? englishSubcategoryName,
    String? frenchSubcategoryName,
    String? subcategoryImage,
  }) {
    _subcategoryId = subcategoryId;
    _englishSubcategoryName = englishSubcategoryName;
    _frenchSubcategoryName = frenchSubcategoryName;
    _subcategoryImage = subcategoryImage;
  }

  Data.fromJson(dynamic json) {
    _subcategoryId = json['subcategoryId'];
    _englishSubcategoryName = json['english_subcategory_name'];
    _frenchSubcategoryName = json['french_subcategory_name'];
    _subcategoryImage = json['subcategory_image'];
  }

  String? _subcategoryId;
  String? _englishSubcategoryName;
  String? _frenchSubcategoryName;
  String? _subcategoryImage;

  Data copyWith({
    String? subcategoryId,
    String? englishSubcategoryName,
    String? frenchSubcategoryName,
    String? subcategoryImage,
  }) =>
      Data(
        subcategoryId: subcategoryId ?? _subcategoryId,
        englishSubcategoryName:
            englishSubcategoryName ?? _englishSubcategoryName,
        frenchSubcategoryName: frenchSubcategoryName ?? _frenchSubcategoryName,
        subcategoryImage: subcategoryImage ?? _subcategoryImage,
      );

  String? get subcategoryId => _subcategoryId;

  String? get englishSubcategoryName => _englishSubcategoryName;

  String? get frenchSubcategoryName => _frenchSubcategoryName;

  String? get subcategoryImage => _subcategoryImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subcategoryId'] = _subcategoryId;
    map['english_subcategory_name'] = _englishSubcategoryName;
    map['french_subcategory_name'] = _frenchSubcategoryName;
    map['subcategory_image'] = _subcategoryImage;
    return map;
  }
}
