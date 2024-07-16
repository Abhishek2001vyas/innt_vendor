import 'dart:convert';

/// result : "true"
/// message : "Product list get sucessfully"
/// data : [{"productId":"65e6f54911e29e4c0ee9cd8e","venderId":"65e6b5ad2ec9465f402935a2","product_name":"shirt","productType":"Footwears","product_code":"44","description":"gg","sale_price":0,"image":"Screenshot_20230829-091749_DiabetesM.jpg","status":0},{"productId":"65e6f5c611e29e4c0ee9cda3","venderId":"65e6b5ad2ec9465f402935a2","product_name":"shirt6vv","productType":"Footwears","product_code":"44","description":"gg","sale_price":0,"image":"Screenshot_20230829-091421_DiabetesM.jpg","status":0},{"productId":"65e6f89111e29e4c0ee9f406","venderId":"65e6b5ad2ec9465f402935a2","product_name":"shirt6vv6","productType":"Footwears","product_code":"44","description":"gg","sale_price":0,"image":"Screenshot_20230829-091749_DiabetesM.jpg","status":0}]

Productlist productlistFromJson(String str) =>
    Productlist.fromJson(json.decode(str));

String productlistToJson(Productlist data) => json.encode(data.toJson());

class Productlist {
  Productlist({
    String? result,
    String? message,
    List<Data1>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  Productlist.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data1.fromJson(v));
      });
    }
  }

  String? _result;
  String? _message;
  List<Data1>? _data;

  Productlist copyWith({
    String? result,
    String? message,
    List<Data1>? data,
  }) =>
      Productlist(
        result: result ?? _result,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get result => _result;

  String? get message => _message;

  List<Data1>? get data => _data;

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

/// productId : "65e6f54911e29e4c0ee9cd8e"
/// venderId : "65e6b5ad2ec9465f402935a2"
/// product_name : "shirt"
/// productType : "Footwears"
/// product_code : "44"
/// description : "gg"
/// sale_price : 0
/// image : "Screenshot_20230829-091749_DiabetesM.jpg"
/// status : 0

Data1 dataFromJson(String str) => Data1.fromJson(json.decode(str));

String dataToJson(Data1 data) => json.encode(data.toJson());

class Data1 {
  Data({
    String? productId,
    String? venderId,
    String? productName,
    String? productType,
    String? productCode,
    String? description,
    num? salePrice,
    String? image,
    num? status,
  }) {
    _productId = productId;
    _venderId = venderId;
    _productName = productName;
    _productType = productType;
    _productCode = productCode;
    _description = description;
    _salePrice = salePrice;
    _image = image;
    _status = status;
  }

  Data1.fromJson(dynamic json) {
    _productId = json['productId'];
    _venderId = json['venderId'];
    _productName = json['product_name'];
    _productType = json['productType'];
    _productCode = json['product_code'];
    _description = json['description'];
    _salePrice = json['sale_price'];
    _image = json['image'];
    _status = json['status'];
  }

  String? _productId;
  String? _venderId;
  String? _productName;
  String? _productType;
  String? _productCode;
  String? _description;
  num? _salePrice;
  String? _image;
  num? _status;

  Data1 copyWith({
    String? productId,
    String? venderId,
    String? productName,
    String? productType,
    String? productCode,
    String? description,
    num? salePrice,
    String? image,
    num? status,
  }) =>
      Data(
        productId: productId ?? _productId,
        venderId: venderId ?? _venderId,
        productName: productName ?? _productName,
        productType: productType ?? _productType,
        productCode: productCode ?? _productCode,
        description: description ?? _description,
        salePrice: salePrice ?? _salePrice,
        image: image ?? _image,
        status: status ?? _status,
      );

  String? get productId => _productId;

  String? get venderId => _venderId;

  String? get productName => _productName;

  String? get productType => _productType;

  String? get productCode => _productCode;

  String? get description => _description;

  num? get salePrice => _salePrice;

  String? get image => _image;

  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['venderId'] = _venderId;
    map['product_name'] = _productName;
    map['productType'] = _productType;
    map['product_code'] = _productCode;
    map['description'] = _description;
    map['sale_price'] = _salePrice;
    map['image'] = _image;
    map['status'] = _status;
    return map;
  }
}
