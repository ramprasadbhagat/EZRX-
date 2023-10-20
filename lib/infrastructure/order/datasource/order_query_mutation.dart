class OrderQueryMutation {
  String submitOrder() {
    return '''
    mutation submitOrderMutation(\$NewOrderInput: NewOrderInputSecure!) {
      submitOrder(order: \$NewOrderInput) {
        SalesDocument
        Messages {
          Type
          Message
        }
      }
    }
    ''';
  }
}
