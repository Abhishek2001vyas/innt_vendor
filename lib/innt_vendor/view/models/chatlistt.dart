class chatlistt {
  String? result;
  String? message;
  List<FilteredMessages>? filteredMessages;

  chatlistt({this.result, this.message, this.filteredMessages});

  chatlistt.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['filteredMessages'] != null) {
      filteredMessages = <FilteredMessages>[];
      json['filteredMessages'].forEach((v) {
        filteredMessages!.add(FilteredMessages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.filteredMessages != null) {
      data['filteredMessages'] =
          this.filteredMessages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FilteredMessages {
  String? userId;
  String? fname;
  String? lname;
  String? image;
  String? mobileNumber;
  String? text;
  int? status;
  var sendStatus;
  String? createdAt;
  String? updatedAt;
  var msgCount;

  FilteredMessages(
      {this.userId,
        this.fname,
        this.lname,
        this.image,
        this.mobileNumber,
        this.text,
        this.status,
        this.sendStatus,
        this.createdAt,
        this.updatedAt,
        this.msgCount});

  FilteredMessages.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? json["driverId"];
    fname = json['fname'];
    lname = json['lname'];
    image = json['image'];
    mobileNumber = json['mobile_number'];
    text = json['text'];
    status = json['status'];
    sendStatus = json['send_status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    msgCount = json['msgCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['image'] = this.image;
    data['mobile_number'] = this.mobileNumber;
    data['text'] = this.text;
    data['status'] = this.status;
    data['send_status'] = this.sendStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['msgCount'] = this.msgCount;
    return data;
  }
}
