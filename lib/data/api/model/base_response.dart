class BaseResponse {
  String? status;
  String? code;
  String? message;

  BaseResponse({
    this.status,
    this.code,
    this.message,
  });

  BaseResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    return map;
  }
}
