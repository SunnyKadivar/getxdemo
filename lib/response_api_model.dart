class ResponseAPI {
  int code;
  String response;
  var isError;
  var isCacheError;
  var error;

  ResponseAPI(this.code, this.response,
      {this.isError, this.isCacheError, this.error});
}
