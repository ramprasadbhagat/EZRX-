class ReturnSummaryQueryMutation {
  String getrequestsByUserV2Query() {
    return '''
       query(\$request: requestsByUserRequest!) {
        requestsByUserV2(request:\$request) 
       {
        requestIds
        requests {
          submitDate
          returnId
          refundTotal
          requestStatus
          items 
          {
            status
            total
            materialNumber
            materialName
            unitPrice
            returnQty
            }
            }
        }
       }
    ''';
  }
}
