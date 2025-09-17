  class ApiResponseModel {
    final bool? isSuccessful;
    final dynamic data;
    final String? message;
    final String? error;
    final int? statusCode;
    ApiResponseModel({
      this.isSuccessful,
      this.data,
      this.message,
      this.error,
      this.statusCode,
    });
  }
