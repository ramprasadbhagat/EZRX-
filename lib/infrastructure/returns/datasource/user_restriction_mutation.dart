class UserRestrictionMutation {
  String getApproverRights() {
    return '''
    query approverRights(\$request: approverRightsRequest!) {  
      approverRights(request: \$request) {    
        rawMetaData {      
          usernames        
        }    
        approverRights {      
          salesOrg      
          principal      
          industryCode1      
          industryCode2      
          industryCode3      
          industryCode4      
          industryCode5      
          plant      
          materialNumber      
          uuid    
        }  
      }
    }
    ''';
  }

  String getUserRestrictions() {
    return '''
    query userRestrictions(\$request: returnApprovalLimitInput!,
             \$approverRequest: approverRightsRequest!){   
              returnApprovalLimit(request: \$request) {
                  username   
                  salesOrg   
                  valueLowerLimit   
                  valueUpperLimit    
                  uuid   
                }
              approverRights(request: \$approverRequest) { 
                 rawMetaData{
                   usernames
                  }
                approverRights { 
                  salesOrg   
                  principal  
                  industryCode1    
                  industryCode2 
                  industryCode3
                  industryCode4
                  industryCode5
                  plant
                  materialNumber
                  uuid

                }
              }
        }
    ''';
  }

  String getReturnApprovalLimit() {
    return '''
    query returnApprovalLimit(\$request: returnApprovalLimitInput!) {  
      returnApprovalLimit(request: \$request) {    
        username,
        valueLowerLimit,
        valueUpperLimit,
       salesOrg,
    
      }
    }
    ''';
  }

  String addApprovalLimit() {
    return '''
        mutation addApprovalLimit(\$request: addReturnApprovalLimitInput!) {
           addReturnApprovalLimit(input: \$request) {
            status
            __typename
           }
          }
        ''';
     }

  String addRestriction() {
    return '''
   mutation addRestriction(\$input: addRestrictionInput!) {
        addRestriction(input: \$input) {
          status
        }
      }
    ''';
  }
}
