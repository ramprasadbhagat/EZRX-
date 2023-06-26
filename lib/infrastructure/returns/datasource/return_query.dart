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
}
