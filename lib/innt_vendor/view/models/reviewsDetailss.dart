import 'dart:convert';

/// result : "true"
/// message : "Review details retrieved successfully"
/// data : [{"ratingId":"65f157bae3f45f7f69acf44d","productId":"65f157bae3f45f7f69acf44d","image":"jeans1.jpg","shopId":"65eaf16c9c99c649416b1f62","product_name":"comfort flex waist jean","productType":"Digital","product_code":"122","rating":0,"raters":1,"ratingsDetails":[{"_id":"65fabf11ed070e81ba9e700d","userId":"65d6fecd3e4d071b479ea66d","productId":"65f157bae3f45f7f69acf44d","rating_status":0,"rating":"4.5","comment":"Product was really good and Product was really good and practical…Product was really good and practical…Product was really good and practical…","__v":0,"userDetails":{"_id":"65d6fecd3e4d071b479ea66d","first_name":"abhishek","last_name":"vyas","mobile_number":"15151515","email":"abhishek@gmail.com","password":"$2b$10$mcFfSb/hPXy7gIud6UoROOYr91aRWnUE6MHlCFGo.hJHWrfpvwrUi","user_profile":"scaled_image_search_1705485255748.jpg","user_referral_code":"938FeUVH","user_status":0,"wallet":0,"referTo_earn":0,"status":0,"otp":5169,"dob":"15/3/2024","createdAt":"2024-02-22T07:59:09.906Z","updatedAt":"2024-03-14T12:48:18.482Z","__v":0}}]}]

ReviewsDetailss reviewsDetailssFromJson(String str) =>
    ReviewsDetailss.fromJson(json.decode(str));

String reviewsDetailssToJson(ReviewsDetailss data) =>
    json.encode(data.toJson());

class ReviewsDetailss {
  ReviewsDetailss({
    String? result,
    String? message,
    List<Data>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  ReviewsDetailss.fromJson(dynamic json) {
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

  ReviewsDetailss copyWith({
    String? result,
    String? message,
    List<Data>? data,
  }) =>
      ReviewsDetailss(
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

/// ratingId : "65f157bae3f45f7f69acf44d"
/// productId : "65f157bae3f45f7f69acf44d"
/// image : "jeans1.jpg"
/// shopId : "65eaf16c9c99c649416b1f62"
/// product_name : "comfort flex waist jean"
/// productType : "Digital"
/// product_code : "122"
/// rating : 0
/// raters : 1
/// ratingsDetails : [{"_id":"65fabf11ed070e81ba9e700d","userId":"65d6fecd3e4d071b479ea66d","productId":"65f157bae3f45f7f69acf44d","rating_status":0,"rating":"4.5","comment":"Product was really good and Product was really good and practical…Product was really good and practical…Product was really good and practical…","__v":0,"userDetails":{"_id":"65d6fecd3e4d071b479ea66d","first_name":"abhishek","last_name":"vyas","mobile_number":"15151515","email":"abhishek@gmail.com","password":"$2b$10$mcFfSb/hPXy7gIud6UoROOYr91aRWnUE6MHlCFGo.hJHWrfpvwrUi","user_profile":"scaled_image_search_1705485255748.jpg","user_referral_code":"938FeUVH","user_status":0,"wallet":0,"referTo_earn":0,"status":0,"otp":5169,"dob":"15/3/2024","createdAt":"2024-02-22T07:59:09.906Z","updatedAt":"2024-03-14T12:48:18.482Z","__v":0}}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? ratingId,
    String? productId,
    String? image,
    String? shopId,
    String? productName,
    String? productType,
    String? productCode,
    num? rating,
    num? raters,
    List<RatingsDetails>? ratingsDetails,
  }) {
    _ratingId = ratingId;
    _productId = productId;
    _image = image;
    _shopId = shopId;
    _productName = productName;
    _productType = productType;
    _productCode = productCode;
    _rating = rating;
    _raters = raters;
    _ratingsDetails = ratingsDetails;
  }

  Data.fromJson(dynamic json) {
    _ratingId = json['ratingId'];
    _productId = json['productId'];
    _image = json['image'];
    _shopId = json['shopId'];
    _productName = json['product_name'];
    _productType = json['productType'];
    _productCode = json['product_code'];
    _rating = json['rating'];
    _raters = json['raters'];
    if (json['ratingsDetails'] != null) {
      _ratingsDetails = [];
      json['ratingsDetails'].forEach((v) {
        _ratingsDetails?.add(RatingsDetails.fromJson(v));
      });
    }
  }

  String? _ratingId;
  String? _productId;
  String? _image;
  String? _shopId;
  String? _productName;
  String? _productType;
  String? _productCode;
  num? _rating;
  num? _raters;
  List<RatingsDetails>? _ratingsDetails;

  Data copyWith({
    String? ratingId,
    String? productId,
    String? image,
    String? shopId,
    String? productName,
    String? productType,
    String? productCode,
    num? rating,
    num? raters,
    List<RatingsDetails>? ratingsDetails,
  }) =>
      Data(
        ratingId: ratingId ?? _ratingId,
        productId: productId ?? _productId,
        image: image ?? _image,
        shopId: shopId ?? _shopId,
        productName: productName ?? _productName,
        productType: productType ?? _productType,
        productCode: productCode ?? _productCode,
        rating: rating ?? _rating,
        raters: raters ?? _raters,
        ratingsDetails: ratingsDetails ?? _ratingsDetails,
      );

  String? get ratingId => _ratingId;

  String? get productId => _productId;

  String? get image => _image;

  String? get shopId => _shopId;

  String? get productName => _productName;

  String? get productType => _productType;

  String? get productCode => _productCode;

  num? get rating => _rating;

  num? get raters => _raters;

  List<RatingsDetails>? get ratingsDetails => _ratingsDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ratingId'] = _ratingId;
    map['productId'] = _productId;
    map['image'] = _image;
    map['shopId'] = _shopId;
    map['product_name'] = _productName;
    map['productType'] = _productType;
    map['product_code'] = _productCode;
    map['rating'] = _rating;
    map['raters'] = _raters;
    if (_ratingsDetails != null) {
      map['ratingsDetails'] = _ratingsDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "65fabf11ed070e81ba9e700d"
/// userId : "65d6fecd3e4d071b479ea66d"
/// productId : "65f157bae3f45f7f69acf44d"
/// rating_status : 0
/// rating : "4.5"
/// comment : "Product was really good and Product was really good and practical…Product was really good and practical…Product was really good and practical…"
/// __v : 0
/// userDetails : {"_id":"65d6fecd3e4d071b479ea66d","first_name":"abhishek","last_name":"vyas","mobile_number":"15151515","email":"abhishek@gmail.com","password":"$2b$10$mcFfSb/hPXy7gIud6UoROOYr91aRWnUE6MHlCFGo.hJHWrfpvwrUi","user_profile":"scaled_image_search_1705485255748.jpg","user_referral_code":"938FeUVH","user_status":0,"wallet":0,"referTo_earn":0,"status":0,"otp":5169,"dob":"15/3/2024","createdAt":"2024-02-22T07:59:09.906Z","updatedAt":"2024-03-14T12:48:18.482Z","__v":0}

RatingsDetails ratingsDetailsFromJson(String str) =>
    RatingsDetails.fromJson(json.decode(str));

String ratingsDetailsToJson(RatingsDetails data) => json.encode(data.toJson());

class RatingsDetails {
  RatingsDetails({
    String? id,
    String? userId,
    String? productId,
    num? ratingStatus,
    String? rating,
    String? comment,
    num? v,
    UserDetails? userDetails,
  }) {
    _id = id;
    _userId = userId;
    _productId = productId;
    _ratingStatus = ratingStatus;
    _rating = rating;
    _comment = comment;
    _v = v;
    _userDetails = userDetails;
  }

  RatingsDetails.fromJson(dynamic json) {
    _id = json['_id'];
    _userId = json['userId'];
    _productId = json['productId'];
    _ratingStatus = json['rating_status'];
    _rating = json['rating'];
    _comment = json['comment'];
    _v = json['__v'];
    _userDetails = json['userDetails'] != null
        ? UserDetails.fromJson(json['userDetails'])
        : null;
  }

  String? _id;
  String? _userId;
  String? _productId;
  num? _ratingStatus;
  String? _rating;
  String? _comment;
  num? _v;
  UserDetails? _userDetails;

  RatingsDetails copyWith({
    String? id,
    String? userId,
    String? productId,
    num? ratingStatus,
    String? rating,
    String? comment,
    num? v,
    UserDetails? userDetails,
  }) =>
      RatingsDetails(
        id: id ?? _id,
        userId: userId ?? _userId,
        productId: productId ?? _productId,
        ratingStatus: ratingStatus ?? _ratingStatus,
        rating: rating ?? _rating,
        comment: comment ?? _comment,
        v: v ?? _v,
        userDetails: userDetails ?? _userDetails,
      );

  String? get id => _id;

  String? get userId => _userId;

  String? get productId => _productId;

  num? get ratingStatus => _ratingStatus;

  String? get rating => _rating;

  String? get comment => _comment;

  num? get v => _v;

  UserDetails? get userDetails => _userDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['userId'] = _userId;
    map['productId'] = _productId;
    map['rating_status'] = _ratingStatus;
    map['rating'] = _rating;
    map['comment'] = _comment;
    map['__v'] = _v;
    if (_userDetails != null) {
      map['userDetails'] = _userDetails?.toJson();
    }
    return map;
  }
}

/// _id : "65d6fecd3e4d071b479ea66d"
/// first_name : "abhishek"
/// last_name : "vyas"
/// mobile_number : "15151515"
/// email : "abhishek@gmail.com"
/// password : "$2b$10$mcFfSb/hPXy7gIud6UoROOYr91aRWnUE6MHlCFGo.hJHWrfpvwrUi"
/// user_profile : "scaled_image_search_1705485255748.jpg"
/// user_referral_code : "938FeUVH"
/// user_status : 0
/// wallet : 0
/// referTo_earn : 0
/// status : 0
/// otp : 5169
/// dob : "15/3/2024"
/// createdAt : "2024-02-22T07:59:09.906Z"
/// updatedAt : "2024-03-14T12:48:18.482Z"
/// __v : 0

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    String? id,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? email,
    String? password,
    String? userProfile,
    String? userReferralCode,
    num? userStatus,
    num? wallet,
    num? referToEarn,
    num? status,
    num? otp,
    String? dob,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _mobileNumber = mobileNumber;
    _email = email;
    _password = password;
    _userProfile = userProfile;
    _userReferralCode = userReferralCode;
    _userStatus = userStatus;
    _wallet = wallet;
    _referToEarn = referToEarn;
    _status = status;
    _otp = otp;
    _dob = dob;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  UserDetails.fromJson(dynamic json) {
    _id = json['_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _mobileNumber = json['mobile_number'];
    _email = json['email'];
    _password = json['password'];
    _userProfile = json['user_profile'];
    _userReferralCode = json['user_referral_code'];
    _userStatus = json['user_status'];
    _wallet = json['wallet'];
    _referToEarn = json['referTo_earn'];
    _status = json['status'];
    _otp = json['otp'];
    _dob = json['dob'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _firstName;
  String? _lastName;
  String? _mobileNumber;
  String? _email;
  String? _password;
  String? _userProfile;
  String? _userReferralCode;
  num? _userStatus;
  num? _wallet;
  num? _referToEarn;
  num? _status;
  num? _otp;
  String? _dob;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  UserDetails copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? email,
    String? password,
    String? userProfile,
    String? userReferralCode,
    num? userStatus,
    num? wallet,
    num? referToEarn,
    num? status,
    num? otp,
    String? dob,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      UserDetails(
        id: id ?? _id,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        mobileNumber: mobileNumber ?? _mobileNumber,
        email: email ?? _email,
        password: password ?? _password,
        userProfile: userProfile ?? _userProfile,
        userReferralCode: userReferralCode ?? _userReferralCode,
        userStatus: userStatus ?? _userStatus,
        wallet: wallet ?? _wallet,
        referToEarn: referToEarn ?? _referToEarn,
        status: status ?? _status,
        otp: otp ?? _otp,
        dob: dob ?? _dob,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );

  String? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get mobileNumber => _mobileNumber;

  String? get email => _email;

  String? get password => _password;

  String? get userProfile => _userProfile;

  String? get userReferralCode => _userReferralCode;

  num? get userStatus => _userStatus;

  num? get wallet => _wallet;

  num? get referToEarn => _referToEarn;

  num? get status => _status;

  num? get otp => _otp;

  String? get dob => _dob;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['mobile_number'] = _mobileNumber;
    map['email'] = _email;
    map['password'] = _password;
    map['user_profile'] = _userProfile;
    map['user_referral_code'] = _userReferralCode;
    map['user_status'] = _userStatus;
    map['wallet'] = _wallet;
    map['referTo_earn'] = _referToEarn;
    map['status'] = _status;
    map['otp'] = _otp;
    map['dob'] = _dob;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
