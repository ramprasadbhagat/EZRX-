class OrderTemplateQueries {
  
String getOrderTemplates() {
    return '''
     query (\$userId: String!){
         orderTemplates(filter:{user:{id:\$userId}}
        sort: "created_at"){
         id
         name
         cartList
         user{id}
     }
     }
     ''';
  }

  String deleteOrderTemplateQuery() {
    return '''
      mutation deleteOrderTemplate(\$input: Int!) {
        deleteOrderTemplate(input : 
          {
            id: \$input
          }
        ) {
        orderTemplate{
            id
        } }
    }
    ''';
  }

  String saveOrderTemplate() {
    return '''
      mutation saveOrderTemplateMutation(\$input: CreateOrderTemplateInput!) {
          createOrderTemplate(input: \$input) {
              orderTemplate {
                  id
                  name
                  cartList
                  user{id}                 
              }
          }
      }
    ''';
  }
}
