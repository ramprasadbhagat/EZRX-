// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class BannerQueryMutation {
  // For fetching banners data by Sales Org
  String getBannerQuery(bool isPreSalesOrg, String salesOrg) {
    return '''
    {
      getBanners(request: {isPreSalesOrg: $isPreSalesOrg,salesOrg:"$salesOrg"})
        {
          id    
          url    
          title    
          description    
          buttonLabel    
          urlLink    
          isPreSalesOrg  
          salesOrg    
          serial
          isCustomer
      }
    }
    ''';
  }
}
