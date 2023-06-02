class NoDataFromApiError extends Error {
  int? statusCode;

  NoDataFromApiError(this.statusCode);
}

class ApiFailedError extends Error {
  Object e;

  ApiFailedError(this.e);
}
