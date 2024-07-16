class Probrand {
  String? _result;
  String? _message;
  List<Data>? _data;

  Probrand({String? result, String? message, List<Data>? data}) {
    if (result != null) {
      this._result = result;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get result => _result;

  set result(String? result) => _result = result;

  String? get message => _message;

  set message(String? message) => _message = message;

  List<Data>? get data => _data;

  set data(List<Data>? data) => _data = data;

  Probrand.fromJson(Map<String, dynamic> json) {
    _result = json['result'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this._result;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? _sId;
  String? _categoryId;
  List<String>? _brand;
  int? _iV;

  Data({String? sId, String? categoryId, List<String>? brand, int? iV}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (brand != null) {
      this._brand = brand;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get sId => _sId;

  set sId(String? sId) => _sId = sId;

  String? get categoryId => _categoryId;

  set categoryId(String? categoryId) => _categoryId = categoryId;

  List<String>? get brand => _brand;

  set brand(List<String>? brand) => _brand = brand;

  int? get iV => _iV;

  set iV(int? iV) => _iV = iV;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _categoryId = json['categoryId'];
    _brand = json['brand'].cast<String>();
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['categoryId'] = this._categoryId;
    data['brand'] = this._brand;
    data['__v'] = this._iV;
    return data;
  }
}
