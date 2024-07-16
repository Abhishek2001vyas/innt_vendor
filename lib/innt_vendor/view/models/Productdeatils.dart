// class Productdeatils {
//   String? result;
//   String? message;
//   List<Data>? data;
//
//   Productdeatils({this.result, this.message, this.data});
//
//   Productdeatils.fromJson(Map<String, dynamic> json) {
//     result = json['result'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['result'] = this.result;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? sId;
//   String? venderId;
//   String? productName;
//   String? description;
//   String? productType;
//   CategoryId? categoryId;
//   SubcategoryId? subcategoryId;
//   String? subSubcategoryId;
//   String? productCode;
//   String? brandName;
//   String? productPreparationTime;
//   List<Null>? size;
//   List<String>? color;
//   int? unitPrice;
//   int? salePrice;
//   List<Discount>? discount;
//   List<Tax>? tax;
//   int? stock;
//   int? minimumOrder;
//   String? deliveryType;
//   String? productWeight;
//   List<ReturnType>? returnType;
//   String? image1;
//   String? image2;
//   String? image3;
//   String? video;
//   int? likeStatus;
//   int? rating;
//   int? productStatus;
//   int? status;
//   int? adds;
//   int? hotOfDealsStatus;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//
//   Data(
//       {this.sId,
//         this.venderId,
//         this.productName,
//         this.description,
//         this.productType,
//         this.categoryId,
//         this.subcategoryId,
//         this.subSubcategoryId,
//         this.productCode,
//         this.brandName,
//         this.productPreparationTime,
//         this.size,
//         this.color,
//         this.unitPrice,
//         this.salePrice,
//         this.discount,
//         this.tax,
//         this.stock,
//         this.minimumOrder,
//         this.deliveryType,
//         this.productWeight,
//         this.returnType,
//         this.image1,
//         this.image2,
//         this.image3,
//         this.video,
//         this.likeStatus,
//         this.rating,
//         this.productStatus,
//         this.status,
//         this.adds,
//         this.hotOfDealsStatus,
//         this.createdAt,
//         this.updatedAt,
//         this.iV});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     venderId = json['venderId'];
//     productName = json['product_name'];
//     description = json['description'];
//     productType = json['productType'];
//     categoryId = json['categoryId'] != null
//         ? new CategoryId.fromJson(json['categoryId'])
//         : null;
//     subcategoryId = json['subcategoryId'] != null
//         ? new SubcategoryId.fromJson(json['subcategoryId'])
//         : null;
//     subSubcategoryId = json['sub_subcategoryId'];
//     productCode = json['product_code'];
//     brandName = json['brand_name'];
//     productPreparationTime = json['productPreparation_time'];
//     if (json['size'] != null) {
//       size = <Null>[];
//       json['size'].forEach((v) {
//         size!.add(new Null.fromJson(v));
//       });
//     }
//     color = json['color'].cast<String>();
//     unitPrice = json['unit_price'];
//     salePrice = json['sale_price'];
//     if (json['discount'] != null) {
//       discount = <Discount>[];
//       json['discount'].forEach((v) {
//         discount!.add(new Discount.fromJson(v));
//       });
//     }
//     if (json['Tax'] != null) {
//       tax = <Tax>[];
//       json['Tax'].forEach((v) {
//         tax!.add(new Tax.fromJson(v));
//       });
//     }
//     stock = json['stock'];
//     minimumOrder = json['minimum_order'];
//     deliveryType = json['deliveryType'];
//     productWeight = json['product_weight'];
//     if (json['returnType'] != null) {
//       returnType = <ReturnType>[];
//       json['returnType'].forEach((v) {
//         returnType!.add(new ReturnType.fromJson(v));
//       });
//     }
//     image1 = json['image1'];
//     image2 = json['image2'];
//     image3 = json['image3'];
//     video = json['video'];
//     likeStatus = json['like_status'];
//     rating = json['rating'];
//     productStatus = json['product_status'];
//     status = json['status'];
//     adds = json['adds'];
//     hotOfDealsStatus = json['hot_of_deals_status'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['venderId'] = this.venderId;
//     data['product_name'] = this.productName;
//     data['description'] = this.description;
//     data['productType'] = this.productType;
//     if (this.categoryId != null) {
//       data['categoryId'] = this.categoryId!.toJson();
//     }
//     if (this.subcategoryId != null) {
//       data['subcategoryId'] = this.subcategoryId!.toJson();
//     }
//     data['sub_subcategoryId'] = this.subSubcategoryId;
//     data['product_code'] = this.productCode;
//     data['brand_name'] = this.brandName;
//     data['productPreparation_time'] = this.productPreparationTime;
//     if (this.size != null) {
//       data['size'] = this.size!.map((v) => v.toJson()).toList();
//     }
//     data['color'] = this.color;
//     data['unit_price'] = this.unitPrice;
//     data['sale_price'] = this.salePrice;
//     if (this.discount != null) {
//       data['discount'] = this.discount!.map((v) => v.toJson()).toList();
//     }
//     if (this.tax != null) {
//       data['Tax'] = this.tax!.map((v) => v.toJson()).toList();
//     }
//     data['stock'] = this.stock;
//     data['minimum_order'] = this.minimumOrder;
//     data['deliveryType'] = this.deliveryType;
//     data['product_weight'] = this.productWeight;
//     if (this.returnType != null) {
//       data['returnType'] = this.returnType!.map((v) => v.toJson()).toList();
//     }
//     data['image1'] = this.image1;
//     data['image2'] = this.image2;
//     data['image3'] = this.image3;
//     data['video'] = this.video;
//     data['like_status'] = this.likeStatus;
//     data['rating'] = this.rating;
//     data['product_status'] = this.productStatus;
//     data['status'] = this.status;
//     data['adds'] = this.adds;
//     data['hot_of_deals_status'] = this.hotOfDealsStatus;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class CategoryId {
//   String? sId;
//   String? maincategoryId;
//   String? categoryImage;
//   int? acrtiveStatus;
//   String? categoryEnglishName;
//   String? categoryFrenchName;
//   int? iV;
//
//   CategoryId(
//       {this.sId,
//         this.maincategoryId,
//         this.categoryImage,
//         this.acrtiveStatus,
//         this.categoryEnglishName,
//         this.categoryFrenchName,
//         this.iV});
//
//   CategoryId.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     maincategoryId = json['maincategoryId'];
//     categoryImage = json['category_image'];
//     acrtiveStatus = json['acrtive_status'];
//     categoryEnglishName = json['category_englishName'];
//     categoryFrenchName = json['category_frenchName'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['maincategoryId'] = this.maincategoryId;
//     data['category_image'] = this.categoryImage;
//     data['acrtive_status'] = this.acrtiveStatus;
//     data['category_englishName'] = this.categoryEnglishName;
//     data['category_frenchName'] = this.categoryFrenchName;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class SubcategoryId {
//   String? sId;
//   String? categoryId;
//   String? englishSubcategoryName;
//   String? frenchSubcategoryName;
//   String? subcategoryImage;
//   int? activeStatus;
//   int? iV;
//
//   SubcategoryId(
//       {this.sId,
//         this.categoryId,
//         this.englishSubcategoryName,
//         this.frenchSubcategoryName,
//         this.subcategoryImage,
//         this.activeStatus,
//         this.iV});
//
//   SubcategoryId.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     categoryId = json['categoryId'];
//     englishSubcategoryName = json['english_subcategory_name'];
//     frenchSubcategoryName = json['french_subcategory_name'];
//     subcategoryImage = json['subcategory_image'];
//     activeStatus = json['active_status'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['categoryId'] = this.categoryId;
//     data['english_subcategory_name'] = this.englishSubcategoryName;
//     data['french_subcategory_name'] = this.frenchSubcategoryName;
//     data['subcategory_image'] = this.subcategoryImage;
//     data['active_status'] = this.activeStatus;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class Discount {
//   String? discountType;
//   int? discountValue;
//   String? sId;
//
//   Discount({this.discountType, this.discountValue, this.sId});
//
//   Discount.fromJson(Map<String, dynamic> json) {
//     discountType = json['discount_type'];
//     discountValue = json['discount_value'];
//     sId = json['_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['discount_type'] = this.discountType;
//     data['discount_value'] = this.discountValue;
//     data['_id'] = this.sId;
//     return data;
//   }
// }
//
// class Tax {
//   String? taxName;
//   int? taxValue;
//   String? sId;
//
//   Tax({this.taxName, this.taxValue, this.sId});
//
//   Tax.fromJson(Map<String, dynamic> json) {
//     taxName = json['tax_name'];
//     taxValue = json['tax_value'];
//     sId = json['_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['tax_name'] = this.taxName;
//     data['tax_value'] = this.taxValue;
//     data['_id'] = this.sId;
//     return data;
//   }
// }
//
// class ReturnType {
//   bool? type;
//   Null? value;
//   String? sId;
//
//   ReturnType({this.type, this.value, this.sId});
//
//   ReturnType.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     value = json['value'];
//     sId = json['_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['value'] = this.value;
//     data['_id'] = this.sId;
//     return data;
//   }
// }
