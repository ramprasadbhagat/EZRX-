class ReturnRequestTypeCodeQuery {
  String getReturnRequestTypeCode() {
    return '''query typeOfRequest(\$request: typeOfRequestRequest!) {
      typeOfRequest(request: \$request) {
          returnCode,
          returnDesc,
        }
      }''';
  }
}
