class StockInfoQueryMutation {
  String getStockInfo() {
    return '''
      query stockInformation(
        \$materialNumber: String!, 
        \$customerCode: String, 
        \$salesOrganisation: String, 
        \$principalCode: String){
          stockInformation(
            materialNumber:\$materialNumber, 
            customerCode:\$customerCode, 
            salesOrganisation:\$salesOrganisation,
            principalCode:\$principalCode){
              MaterialNumber ,
              Batch,
              ExpiryDate,
              InStock,
              SalesDistrict,
              StockQuantity
            }
        }
    ''';
  }

  String getMaterialStockInfoListQuery() {
    return '''
    query (\$request: GetStockInformationListsRequest!) {
      getStockInformationLists(request: \$request) {
        MaterialNumber
        StockInformation {
          MaterialNumber
          Batch
          ExpiryDate
          InStock
          ShelfLife
          SalesDistrict
          StockQuantity
        }
      }
    }
    ''';
  }
}
