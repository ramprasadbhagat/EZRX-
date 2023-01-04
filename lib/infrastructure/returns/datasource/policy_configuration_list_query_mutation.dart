class PolicyConfigurationListQueryMutation {
  String getPolicyConfigurationList() {
    return '''query policies(\$request: policiesRequest!) {  
    policies(request: \$request) {    
    salesOrg    
    principalCode    
    monthsBeforeExpiry    
    monthsAfterExpiry    
    uuid   
    returnsAllowed    
    principalName
     }
    } ''';
  }
}
