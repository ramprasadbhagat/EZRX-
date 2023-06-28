class ReturnQuery {
  String getRequestsByItems() {
    return '''
      query requestsByItems(\$request: requestsByItems!) {
        requestsByItems(request: \$request) {
          returnRequestsByItems {
            requestDate
            requestByItems {
              requestId
              requestDate
              itemQty
              totalPrice
              status
              materialNumber
              materialName
              DefaultMaterialDescription
              orderNumber
              invoiceID
              customerName
              batch
              expiry
            }
          }
          totalCount
        }
      }
    ''';
  }

  String getRequestsByRequest() {
    return '''
      query requestsByUserV3(\$requestsByUserRequest: requestsByUserRequestV3!) {
        requestsByUserV3(request: \$requestsByUserRequest) {
          returnRequests {
            requestId
            requestDate
            itemQty
            totalPrice
            status
          }
          totalCount
        }
      }
    ''';
  }
}
