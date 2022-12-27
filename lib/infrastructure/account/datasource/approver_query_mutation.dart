class ApproverQueryMutation {
  String getIsApprover() {
    return '''
    query isApprover(\$request: isApproverRequest!) {
      isApprover(request: \$request) {
          isApprover
          __typename
      }
    }         
    ''';
  }
}
