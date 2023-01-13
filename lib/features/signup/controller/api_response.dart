class ApiResponse<T> {
  T? data;
  bool? error;
  String? errorMessage;
  int? responseCode;
  T? errorResponse;

  ApiResponse(
      {this.data,
      this.error,
      this.errorMessage,
      this.responseCode,
      this.errorResponse});
}
