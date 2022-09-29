class BaseResponse {
  String message = "";
  bool success = false;

  BaseResponse({required this.message, required this.success});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(success: json["status"], message: json["msg"]);
  }
}
