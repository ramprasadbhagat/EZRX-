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
}
