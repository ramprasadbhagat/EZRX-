class RecentOrdersQueryMutation {
  /* Query for fetching Recent Orders */

  String getRecentOrderedProducts() {
    return '''
        query recentOrders(\$soldTo: String!, \$shipTo: String!, \$language: String!, \$first: Int!, \$after: Int!) {
          recentOrders(
            soldTo: \$soldTo
            shipTo: \$shipTo
            language: \$language
            first: \$first
            after: \$after
          ) {
            orderBasicInformation {
              SoldTo
              ShipTo
              CompanyName
            }
            orderItems {
              MaterialCode
              MaterialDescription
              DefaultMaterialDescription
              Qty
              UnitPrice
              TotalPrice
              ManufactureName
              Seller
              IsMarketplace
              OrderNumber
              EZRXNumber
              WarehouseStorageCondition
              Available
              OrderBy
              OrderType
              HidePrice
            }
          }
        }
   ''';
  }
}
