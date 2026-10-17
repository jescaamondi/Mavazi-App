class ApiError {
  final String message;

  ApiError({
    required this.message,
  });

  // Automatically creates an ApiError from your backend's JSON response
  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      message: json['message'] ?? 'Something went wrong. Please try again.',
    );
  }
}
