class HTTPResponseValidator {
  static bool isValidStatusCode(int statusCode) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else {
      throw HTTPExeption(statusCode);
    }
  }
}

class HTTPExeption implements Exception {
  HTTPExeption(this.statusCode);
  final int statusCode;
  @override
  String toString() {
    String message;
    switch (statusCode) {
      case 400:
        message = "Bad Requset";
        break;
      case 401:
        message = "Unauthorized";
        break;
      case 403:
        message = "Forbidden";
        break;
      case 404:
        message = "Not Found";
        break;
      case 409:
        message = "Conflict";
        break;
      case 500:
        message = "Intrnal Server Error";
        break;

      default:
        message = "UnKnow Erorr";
        break;
    }
    return "HTTPExeption: Status Code: $statusCode, msg:$message";
  }
}
