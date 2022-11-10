class OrderDocumentTypeQueryMutation {
  String getOrderDocumentType() {
    return '''
      query orderDocumentType(\$salesOrg: String!) {
        orderDocumentType(request: { salesOrg: \$salesOrg }) {
          documentTypes {
            salesOrg
            documentType
            description
            shippingCondition
            orderReason
          }
        }
      }
    ''';
  }
}
