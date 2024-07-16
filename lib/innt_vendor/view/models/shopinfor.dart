import 'dart:convert';

/// result : "true"
/// message : "Shop details get successfully"
/// data : {"sellerId":"65eaf16c9c99c649416b1f62","shopName":"sachin general store","sellerImage":"1000063523.webp","sellerMobile":"45678912","shopAddress":"vijay nagar indore","shopImage":"Screenshot_20230829-091421_DiabetesM.jpg","totalProduct":0,"totalSales":0,"totalReviews":0,"totalLiked_items":0,"pageViews":0,"shop_rating":0}

Shopinfor shopinforFromJson(String str) => Shopinfor.fromJson(json.decode(str));

String shopinforToJson(Shopinfor data) => json.encode(data.toJson());

class Shopinfor {
  Shopinfor({
    String? result,
    String? message,
    Data? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  Shopinfor.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _result;
  String? _message;
  Data? _data;

  Shopinfor copyWith({
    String? result,
    String? message,
    Data? data,
  }) =>
      Shopinfor(
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

/// sellerId : "65eaf16c9c99c649416b1f62"
/// shopName : "sachin general store"
/// sellerImage : "1000063523.webp"
/// sellerMobile : "45678912"
/// shopAddress : "vijay nagar indore"
/// shopImage : "Screenshot_20230829-091421_DiabetesM.jpg"
/// totalProduct : 0
/// totalSales : 0
/// totalReviews : 0
/// totalLiked_items : 0
/// pageViews : 0
/// shop_rating : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? sellerId,
    String? shopName,
    String? sellerImage,
    String? sellerMobile,
    String? shopAddress,
    String? shopImage,
    num? totalProduct,
    num? totalSales,
    num? totalReviews,
    num? totalLikedItems,
    num? pageViews,
    num? shopRating,
  }) {
    _sellerId = sellerId;
    _shopName = shopName;
    _sellerImage = sellerImage;
    _sellerMobile = sellerMobile;
    _shopAddress = shopAddress;
    _shopImage = shopImage;
    _totalProduct = totalProduct;
    _totalSales = totalSales;
    _totalReviews = totalReviews;
    _totalLikedItems = totalLikedItems;
    _pageViews = pageViews;
    _shopRating = shopRating;
  }

  Data.fromJson(dynamic json) {
    _sellerId = json['sellerId'];
    _shopName = json['shopName'];
    _sellerImage = json['sellerImage'];
    _sellerMobile = json['sellerMobile'];
    _shopAddress = json['shopAddress'];
    _shopImage = json['shopImage'];
    _totalProduct = json['totalProduct'];
    _totalSales = json['totalSales'];
    _totalReviews = json['totalReviews'];
    _totalLikedItems = json['totalLiked_items'];
    _pageViews = json['pageViews'];
    _shopRating = json['shop_rating'];
  }

  String? _sellerId;
  String? _shopName;
  String? _sellerImage;
  String? _sellerMobile;
  String? _shopAddress;
  String? _shopImage;
  num? _totalProduct;
  num? _totalSales;
  num? _totalReviews;
  num? _totalLikedItems;
  num? _pageViews;
  num? _shopRating;

  Data copyWith({
    String? sellerId,
    String? shopName,
    String? sellerImage,
    String? sellerMobile,
    String? shopAddress,
    String? shopImage,
    num? totalProduct,
    num? totalSales,
    num? totalReviews,
    num? totalLikedItems,
    num? pageViews,
    num? shopRating,
  }) =>
      Data(
        sellerId: sellerId ?? _sellerId,
        shopName: shopName ?? _shopName,
        sellerImage: sellerImage ?? _sellerImage,
        sellerMobile: sellerMobile ?? _sellerMobile,
        shopAddress: shopAddress ?? _shopAddress,
        shopImage: shopImage ?? _shopImage,
        totalProduct: totalProduct ?? _totalProduct,
        totalSales: totalSales ?? _totalSales,
        totalReviews: totalReviews ?? _totalReviews,
        totalLikedItems: totalLikedItems ?? _totalLikedItems,
        pageViews: pageViews ?? _pageViews,
        shopRating: shopRating ?? _shopRating,
      );

  String? get sellerId => _sellerId;

  String? get shopName => _shopName;

  String? get sellerImage => _sellerImage;

  String? get sellerMobile => _sellerMobile;

  String? get shopAddress => _shopAddress;

  String? get shopImage => _shopImage;

  num? get totalProduct => _totalProduct;

  num? get totalSales => _totalSales;

  num? get totalReviews => _totalReviews;

  num? get totalLikedItems => _totalLikedItems;

  num? get pageViews => _pageViews;

  num? get shopRating => _shopRating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sellerId'] = _sellerId;
    map['shopName'] = _shopName;
    map['sellerImage'] = _sellerImage;
    map['sellerMobile'] = _sellerMobile;
    map['shopAddress'] = _shopAddress;
    map['shopImage'] = _shopImage;
    map['totalProduct'] = _totalProduct;
    map['totalSales'] = _totalSales;
    map['totalReviews'] = _totalReviews;
    map['totalLiked_items'] = _totalLikedItems;
    map['pageViews'] = _pageViews;
    map['shop_rating'] = _shopRating;
    return map;
  }
}
