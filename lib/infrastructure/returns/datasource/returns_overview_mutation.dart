class ReturnsOverviewMutation {
  String getReturnsOverview() {
    return '''
    query returnRequestsOverviewV2(\$request: returnRequestsOverviewRequest!) {  
      returnRequestsOverviewV2(request: \$request) {    
        requestSubmitted
        requestPendingApproval
        requestRejected
        requestForApproval
      }
    }
    ''';
  }
}
