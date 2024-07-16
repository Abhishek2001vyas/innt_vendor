import 'dart:convert';

/// result : "true"
/// message : "Review list retrieved successfully"
/// data : [{"productId":"65f157bae3f45f7f69acf44d","image":"jeans1.jpg","shopId":"65eaf16c9c99c649416b1f62","product_name":"comfort flex waist jean","productType":"Digital","product_code":"122","rating":0,"raters":0},{"productId":"65f1646daba2a8e214b5534d","image":"shirts6.jpg","shopId":"65eaf16c9c99c649416b1f62","product_name":"Short sleeve T-shirt cotton casual shrit","productType":"Digital","product_code":"321","rating":0,"raters":0},{"productId":"65f170a9aba2a8e214b554d4","image":"shirts1.jpg","shopId":"65eaf16c9c99c649416b1f62","product_name":"crew neck soft fitted Tees","productType":"Digital","product_code":"213","rating":0,"raters":0},{"productId":"65f1b45e69e61627081e08e0","image":"-78Wx98H-443005820-navy-MODEL.jpg","shopId":"65eaf16c9c99c649416b1f62","product_name":"Checked Shirt with patch pocket","productType":"Digital","product_code":"44300","rating":0,"raters":0},{"productId":"65f8136eb92db9b1803aaef5","image":"-473Wx593H-469477464-white-MODEL7.jpeg","shopId":"65eaf16c9c99c649416b1f62","product_name":"Men Logo Embroidered Slim Fit Shirt","productType":"Digital","product_code":"222","rating":0,"raters":0},{"productId":"65f815b4b92db9b1803ab00c","image":"-1117Wx1400H-441758586-blue-MODEL5.jpg","shopId":"65eaf16c9c99c649416b1f62","product_name":"Men Regular Fit Shirt with Logo Print","productType":"Digital","product_code":"144","rating":0,"raters":0},{"productId":"65f8185fb92db9b1803ab2a9","image":"-1117Wx1400H-460639739-navy-MODEL.jpeg","shopId":"65eaf16c9c99c649416b1f62","product_name":"Slim Fit 3-Piece Suit Set","productType":"Digital","product_code":"460639739001","rating":0,"raters":0}]

ProductReviewss productReviewssFromJson(String str) =>
    ProductReviewss.fromJson(json.decode(str));

String productReviewssToJson(ProductReviewss data) =>
    json.encode(data.toJson());

class ProductReviewss {
  ProductReviewss({
    String? result,
    String? message,
    List<Data33>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  ProductReviewss.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data33.fromJson(v));
      });
    }
  }

  String? _result;
  String? _message;
  List<Data33>? _data;

  ProductReviewss copyWith({
    String? result,
    String? message,
    List<Data33>? data,
  }) =>
      ProductReviewss(
        result: result ?? _result,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get result => _result;

  String? get message => _message;

  List<Data33>? get data => _data;

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

/// productId : "65f157bae3f45f7f69acf44d"
/// image : "jeans1.jpg"
/// shopId : "65eaf16c9c99c649416b1f62"
/// product_name : "comfort flex waist jean"
/// productType : "Digital"
/// product_code : "122"
/// rating : 0
/// raters : 0

Data33 dataFromJson(String str) => Data33.fromJson(json.decode(str));

String dataToJson(Data33 data) => json.encode(data.toJson());

class Data33 {
  Data33({
    String? productId,
    String? image,
    String? shopId,
    String? productName,
    String? productType,
    String? productCode,
    num? rating,
    num? raters,
  }) {
    _productId = productId;
    _image = image;
    _shopId = shopId;
    _productName = productName;
    _productType = productType;
    _productCode = productCode;
    _rating = rating;
    _raters = raters;
  }

  Data33.fromJson(dynamic json) {
    _productId = json['productId'];
    _image = json['image'];
    _shopId = json['shopId'];
    _productName = json['product_name'];
    _productType = json['productType'];
    _productCode = json['product_code'];
    _rating = json['rating'];
    _raters = json['raters'];
  }

  String? _productId;
  String? _image;
  String? _shopId;
  String? _productName;
  String? _productType;
  String? _productCode;
  num? _rating;
  num? _raters;

  Data33 copyWith({
    String? productId,
    String? image,
    String? shopId,
    String? productName,
    String? productType,
    String? productCode,
    num? rating,
    num? raters,
  }) =>
      Data33(
        productId: productId ?? _productId,
        image: image ?? _image,
        shopId: shopId ?? _shopId,
        productName: productName ?? _productName,
        productType: productType ?? _productType,
        productCode: productCode ?? _productCode,
        rating: rating ?? _rating,
        raters: raters ?? _raters,
      );

  String? get productId => _productId;

  String? get image => _image;

  String? get shopId => _shopId;

  String? get productName => _productName;

  String? get productType => _productType;

  String? get productCode => _productCode;

  num? get rating => _rating;

  num? get raters => _raters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['image'] = _image;
    map['shopId'] = _shopId;
    map['product_name'] = _productName;
    map['productType'] = _productType;
    map['product_code'] = _productCode;
    map['rating'] = _rating;
    map['raters'] = _raters;
    return map;
  }
}
