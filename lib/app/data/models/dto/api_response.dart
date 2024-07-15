class ApiResponse<T> {
  bool success;
  T? data;
  String? errorMessage;

  ApiResponse({required this.success, this.data, this.errorMessage});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return ApiResponse<T>(
      success: json['success'] ?? false,
      data: fromJson(json['data']),
      errorMessage: (json['errorMessage'] != null) ? json['errorMessage'] : "",
    );
  }
}
