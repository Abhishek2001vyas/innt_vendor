class OrderList {
  String? result;
  String? message;
  String? path;
  List<Data>? data;

  OrderList({this.result, this.message, this.path, this.data});

  OrderList.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    path = json['path'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    data['path'] = this.path;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  String? paymentMode;
  var orderId;
  var status;
 var orderDate;
  String? updateDate;
  List<Products>? products;

  Data(
      {this.sId,
      this.userId,
      this.paymentMode,
      this.orderId,
      this.status,
      this.orderDate,
      this.updateDate,
      this.products});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    paymentMode = json['paymentMode'];
    orderId = json['orderId'];
    status = json['status'];
    orderDate = json['order_date'];
    updateDate = json['update_date'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['paymentMode'] = this.paymentMode;
    data['orderId'] = this.orderId;
    data['status'] = this.status;
    data['order_date'] = this.orderDate;
    data['update_date'] = this.updateDate;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? productId;
  String? productName;
  String? shopName;
  String? size;
  String? color;
 var qty;
  var salePrice;
  var discount;
  String? image;
  String? qrcode;
  var subtotal;
  var tax;
  var shippingCharge;
  var total;
  var orderStatus;

  Products(
      {this.productId,
      this.productName,
      this.shopName,
      this.size,
      this.color,
      this.qty,
      this.salePrice,
      this.discount,
      this.image,
      this.qrcode,
      this.subtotal,
      this.tax,
      this.shippingCharge,
      this.total,
      this.orderStatus});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['product_name'];
    shopName = json['shop_name'];
    size = json['size'];
    color = json['color'];
    qty = json['qty'];
    salePrice = json['sale_price'];
    discount = json['discount'];
    image = json['image'];
    qrcode = json['qrcode'];
    subtotal = json['subtotal'];
    tax = json['tax'];
    shippingCharge = json['shipping_charge'];
    total = json['total'];
    orderStatus = json['order_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['product_name'] = this.productName;
    data['shop_name'] = this.shopName;
    data['size'] = this.size;
    data['color'] = this.color;
    data['qty'] = this.qty;
    data['sale_price'] = this.salePrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['qrcode'] = this.qrcode;
    data['subtotal'] = this.subtotal;
    data['tax'] = this.tax;
    data['shipping_charge'] = this.shippingCharge;
    data['total'] = this.total;
    data['order_status'] = this.orderStatus;
    return data;
  }
}
