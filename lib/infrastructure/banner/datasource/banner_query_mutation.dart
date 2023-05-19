// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class BannerQueryMutation {
  // For fetching banners data by Sales Org
  String getBannerQuery() {
    return '''
      query (\$input:GetBanners!){
        getBanners(request:\$input)
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
            isKeyword  
            keyword
            category   
 
        }
    }
    ''';
  }

  String getEZReachBannerQuery() {
    return '''
      query getLiveCampaigns(
  \$country: String
  \$Salesorg: String
  \$role: String
  \$targetProduct: String
  \$sort: String
) {
  getLiveCampaigns(
    request: {
      country: \$country
      Salesorg: \$Salesorg
      role: \$role
      targetProduct: \$targetProduct
      sort: \$sort
    }
  ) {
    statusCode
    statusMessage
    data {
      bannerId
      bannerCampaignName
      startDate
      bannerCampaignLocations
      bannerUrl
      mobileBannerImg
      endDate
      websiteUrl
      salesOrg
      countryCode
      bannerCountId
      salesRep
      status
      customers
      companyName
      targetProduct
      keyWord
    }
  }
}

    ''';
  }
}
