class LogInEntity {
  final bool success;
  final int statusCode;
  final LogInData? data;
  final String? error;
  final int processingTimeMillis;
  final String? customMsg;

  LogInEntity({
    required this.success,
    required this.statusCode,
    this.data,
    this.error,
    required this.processingTimeMillis,
    this.customMsg,
  });

  factory LogInEntity.fromJson(Map<String, dynamic> json) {
    return LogInEntity(
      success: json['success'] ?? false, // Set default value to false if 'success' field is missing
      statusCode: json['statusCode'] ?? 0, // Set default value to 0 if 'statusCode' field is missing
      data: json['data'] != null ? LogInData.fromJson(json['data']) : null,
      error: json['error'],
      processingTimeMillis: json['processingTimeMillis'] ?? 0, // Set default value to 0 if 'processingTimeMillis' field is missing
      customMsg: json['customMsg'],
    );
  }

  factory LogInEntity.empty() {
    return LogInEntity(
      success: false,
      statusCode: 0,
      processingTimeMillis: 0,
    );
  }

}

class LogInData {
  final String token;
  final String refreshToken;

  LogInData({
    required this.token,
    required this.refreshToken,
  });

  factory LogInData.fromJson(Map<String, dynamic> json) {
    return LogInData(
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }
}
