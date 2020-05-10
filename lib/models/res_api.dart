class ResApi {
  bool success;
  String message;
  dynamic data;

  ResApi({
    this.success,
    this.message,
    this.data,
  });

  ResApi.initial()
      : success = false,
        message = "";

  factory ResApi.fromJson(Map<String, dynamic> json) => ResApi(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
