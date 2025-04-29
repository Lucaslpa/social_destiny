sealed class Result<T> {
  const Result();

  const factory Result.success(T data) = ApiSuccess<T>;
  const factory Result.error(String message) = ApiError<T>;
}

final class ApiSuccess<T> extends Result<T> {
  final T data;
  const ApiSuccess(this.data);
}

final class ApiError<T> extends Result<T> {
  final String message;
  const ApiError(this.message);
}
