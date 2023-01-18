class PolicyConfigurationQueryMutation {
  String getPolicyConfiguration() {
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

  String deletePolicyConfiguration() {
    return ''' 
    mutation deletePolicy(\$input: deletePolicyInput!) {
        deletePolicy(input: \$input) {
             status 
           
               }}
    ''';
  }

  String addPolicyConfiguration() {
    return ''' 
    mutation addPolicy(\$input: addPolicyInput!) {
        addPolicy(input: \$input) {
             status 
           
               }}
    ''';
  }
}
