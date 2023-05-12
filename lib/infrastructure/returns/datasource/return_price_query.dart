class ReturnPriceQuery {
  String getReturnPrice() {
    return '''
      query getReturnPrice(\$invoiceDetails: invoiceDetails!)
        {
         getReturnPrice(request: \$invoiceDetails)
         {
          unitPrice 
          totalPrice 
          materialNumber  
          itemNumber 
        }
      }
    ''';
  }
}
