class ProducttypeList {
  String? _result;
  String? _message;
  List<Data>? _data;

  ProducttypeList({String? result, String? message, List<Data>? data}) {
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

  ProducttypeList.fromJson(Map<String, dynamic> json) {
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
  String? _productType;

  Data({String? sId, String? productType}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (productType != null) {
      this._productType = productType;
    }
  }

  String? get sId => _sId;

  set sId(String? sId) => _sId = sId;

  String? get productType => _productType;

  set productType(String? productType) => _productType = productType;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _productType = json['productType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['productType'] = this._productType;
    return data;
  }
}
