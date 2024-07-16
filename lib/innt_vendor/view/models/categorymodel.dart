import 'dart:convert';

/// result : "true"
/// message : "category list are"
/// data : [{"categoryId":"65ab78ae7f6f7c1ef88dea1b","category_englishName":"Beauty and Personal Care","category_frenchName":"beauté et soins personnels","category_image":"imgpsh_fullsize_anim.png"},{"categoryId":"65cdaeda8e0393659722ac96","category_englishName":"Fashion and Apparel","category_frenchName":"mode et vetements","category_image":"imgpsh_fullsize_anim (3).png"},{"categoryId":"65d4823973b617f0dd6c39fa","category_englishName":"Sport & health","category_frenchName":"Sport & santé","category_image":"imgpsh_fullsize_anim (1).png"},{"categoryId":"65d4847dc378422826a0e617","category_englishName":"Home and Kitchen","category_frenchName":"Maison et cuisine","category_image":"imgpsh_fullsize_anim (5).png"},{"categoryId":"65d484adc378422826a0e61d","category_englishName":"Beauty and Personal Care","category_frenchName":"Beauté et soins personnels","category_image":"imgpsh_fullsize_anim (4).png"},{"categoryId":"65d4851cc378422826a0e622","category_englishName":"Electronics and Gadgets","category_frenchName":"Électronique et gadgets","category_image":"imgpsh_fullsize_anim (6).png"}]

Categorymodel categorymodelFromJson(String str) =>
    Categorymodel.fromJson(json.decode(str));

String categorymodelToJson(Categorymodel data) => json.encode(data.toJson());

class Categorymodel {
  Categorymodel({
    String? result,
    String? message,
    List<Data>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  Categorymodel.fromJson(dynamic json) {
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

  Categorymodel copyWith({
    String? result,
    String? message,
    List<Data>? data,
  }) =>
      Categorymodel(
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

/// categoryId : "65ab78ae7f6f7c1ef88dea1b"
/// category_englishName : "Beauty and Personal Care"
/// category_frenchName : "beauté et soins personnels"
/// category_image : "imgpsh_fullsize_anim.png"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? categoryId,
    String? categoryEnglishName,
    String? categoryFrenchName,
    String? categoryImage,
  }) {
    _categoryId = categoryId;
    _categoryEnglishName = categoryEnglishName;
    _categoryFrenchName = categoryFrenchName;
    _categoryImage = categoryImage;
  }

  Data.fromJson(dynamic json) {
    _categoryId = json['categoryId'];
    _categoryEnglishName = json['category_englishName'];
    _categoryFrenchName = json['category_frenchName'];
    _categoryImage = json['category_image'];
  }

  String? _categoryId;
  String? _categoryEnglishName;
  String? _categoryFrenchName;
  String? _categoryImage;

  Data copyWith({
    String? categoryId,
    String? categoryEnglishName,
    String? categoryFrenchName,
    String? categoryImage,
  }) =>
      Data(
        categoryId: categoryId ?? _categoryId,
        categoryEnglishName: categoryEnglishName ?? _categoryEnglishName,
        categoryFrenchName: categoryFrenchName ?? _categoryFrenchName,
        categoryImage: categoryImage ?? _categoryImage,
      );

  String? get categoryId => _categoryId;

  String? get categoryEnglishName => _categoryEnglishName;

  String? get categoryFrenchName => _categoryFrenchName;

  String? get categoryImage => _categoryImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryId'] = _categoryId;
    map['category_englishName'] = _categoryEnglishName;
    map['category_frenchName'] = _categoryFrenchName;
    map['category_image'] = _categoryImage;
    return map;
  }
}
