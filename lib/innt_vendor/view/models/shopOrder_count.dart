import 'dart:convert';

/// result : "true"
/// message : "Order list retrieved successfully"
/// path : "http://103.104.74.215:3037/uploads/"
/// data : {"pending":5,"confirm":0,"packing":0,"shipped":0,"cancel":0,"not_delivered":0,"delivered":0,"return":0}

ShopOrderCount shopOrderCountFromJson(String str) =>
    ShopOrderCount.fromJson(json.decode(str));

String shopOrderCountToJson(ShopOrderCount data) => json.encode(data.toJson());

class ShopOrderCount {
  ShopOrderCount({
    String? result,
    String? message,
    String? path,
    Data? data,
  }) {
    _result = result;
    _message = message;
    _path = path;
    _data = data;
  }

  ShopOrderCount.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _path = json['path'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _result;
  String? _message;
  String? _path;
  Data? _data;

  ShopOrderCount copyWith({
    String? result,
    String? message,
    String? path,
    Data? data,
  }) =>
      ShopOrderCount(
        result: result ?? _result,
        message: message ?? _message,
        path: path ?? _path,
        data: data ?? _data,
      );

  String? get result => _result;

  String? get message => _message;

  String? get path => _path;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    map['path'] = _path;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// pending : 5
/// confirm : 0
/// packing : 0
/// shipped : 0
/// cancel : 0
/// not_delivered : 0
/// delivered : 0
/// return : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    num? pending,
    num? confirm,
    num? packing,
    num? shipped,
    num? cancel,
    num? notDelivered,
    num? delivered,
    num? returns,
  }) {
    _pending = pending;
    _confirm = confirm;
    _packing = packing;
    _shipped = shipped;
    _cancel = cancel;
    _notDelivered = notDelivered;
    _delivered = delivered;
    _returns = returns;
  }

  Data.fromJson(dynamic json) {
    _pending = json['pending'];
    _confirm = json['confirm'];
    _packing = json['packing'];
    _shipped = json['shipped'];
    _cancel = json['cancel'];
    _notDelivered = json['not_delivered'];
    _delivered = json['delivered'];
    _returns = json['return'];
  }

  num? _pending;
  num? _confirm;
  num? _packing;
  num? _shipped;
  num? _cancel;
  num? _notDelivered;
  num? _delivered;
  num? _returns;

  Data copyWith({
    num? pending,
    num? confirm,
    num? packing,
    num? shipped,
    num? cancel,
    num? notDelivered,
    num? delivered,
    num? returns,
  }) =>
      Data(
        pending: pending ?? _pending,
        confirm: confirm ?? _confirm,
        packing: packing ?? _packing,
        shipped: shipped ?? _shipped,
        cancel: cancel ?? _cancel,
        notDelivered: notDelivered ?? _notDelivered,
        delivered: delivered ?? _delivered,
        returns: returns ?? _returns,
      );

  num? get pending => _pending;

  num? get confirm => _confirm;

  num? get packing => _packing;

  num? get shipped => _shipped;

  num? get cancel => _cancel;

  num? get notDelivered => _notDelivered;

  num? get delivered => _delivered;

  num? get returns => _returns;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pending'] = _pending;
    map['confirm'] = _confirm;
    map['packing'] = _packing;
    map['shipped'] = _shipped;
    map['cancel'] = _cancel;
    map['not_delivered'] = _notDelivered;
    map['delivered'] = _delivered;
    map['return'] = _returns;
    return map;
  }
}
