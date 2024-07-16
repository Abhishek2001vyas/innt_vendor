class PromotionList {
  bool result;
  String message;
  List<Promotion> data;

  PromotionList(
      {required this.result, required this.message, required this.data});

  factory PromotionList.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<Promotion> promotions =
        dataList.map((data) => Promotion.fromJson(data)).toList();

    return PromotionList(
      result: json['result'] == 'true', // Parse 'result' as boolean
      message: json['message'],
      data: promotions,
    );
  }
}

class Promotion {
  String id;
  String vendorId;
  String couponType;
  String couponCode;
  String couponTitle;
  int sameUserDiscountLimit;
  int numberOfCoupon;
  String discountType;
  String discountAmount;
  String appliesCoupon;
  String appliesType;
  List<String> idList;
  String expireDate;
  String startDate;
  String actStatus;
  int v;

  Promotion({
    required this.id,
    required this.vendorId,
    required this.couponType,
    required this.couponCode,
    required this.couponTitle,
    required this.sameUserDiscountLimit,
    required this.numberOfCoupon,
    required this.discountType,
    required this.discountAmount,
    required this.appliesCoupon,
    required this.appliesType,
    required this.idList,
    required this.expireDate,
    required this.startDate,
    required this.actStatus,
    required this.v,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    var idFromJson = json['id'];
    List<String> idList = List<String>.from(idFromJson);

    return Promotion(
      id: json['_id'],
      vendorId: json['venderId'],
      couponType: json['cupon_type'],
      couponCode: json['cupon_code'],
      couponTitle: json['cupon_title'],
      sameUserDiscountLimit: json['sameUser_discountLimit'],
      numberOfCoupon: json['numberOfcoupon'],
      discountType: json['discountType'],
      discountAmount: json['discountAmount'],
      appliesCoupon: json['appliesCoupon'],
      appliesType: json['appliesType'],
      idList: idList,
      expireDate: json['expire_date'],
      startDate: json['start_date'],
      actStatus: json['act_status'],
      v: json['__v'],
    );
  }
}
