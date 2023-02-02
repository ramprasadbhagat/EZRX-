class ApproverReturnRequestQuery {
  String getReturnRequestQuery() {
    return '''
       query requestsForApproverV2(\$request: requestsForApproverRequest!) {
        requestsForApproverV2(request: \$request) {
          requestID
          __typename
        }
      }
    ''';
  }
}
