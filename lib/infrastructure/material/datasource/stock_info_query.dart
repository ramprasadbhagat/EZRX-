class StockInfoQueryMutation {
  
  String getStockInfo() {
    return '''
      query stockInformation(
        \$materialNumber: String!, 
        \$plant: String, 
        \$customerCode: String, 
        \$salesOrganisation: String, 
        \$principalCode: String){
          stockInformation(
            materialNumber:\$materialNumber, 
            plant: \$plant,
            customerCode:\$customerCode, 
            salesOrganisation:\$salesOrganisation,
            principalCode:\$principalCode){
              MaterialNumber ,
              Batch,
              ExpiryDate,
              InStock,
              SalesDistrict
            }
        }
    ''';
  }

  String getStockInfoList() {
    return '''
     query stockInformationList(
      \$materialNumber: String!, 
      \$plant: String, 
      \$customerCode: String, 
      \$salesOrganisation: String, 
      \$principalCode: String){
        stockInformationList(
          materialNumber:\$materialNumber, 
          plant: \$plant,
          customerCode:\$customerCode, 
          salesOrganisation:\$salesOrganisation,
          principalCode:\$principalCode){
            MaterialNumber ,
            Batch,
            ExpiryDate,
            InStock,
            SalesDistrict
          }
      }
    ''';
  }
}

