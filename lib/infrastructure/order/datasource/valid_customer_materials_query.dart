class ValidCustomMaterialQuery {
  String getValidCustomerMaterial() {
    return '''
      query (\$input:validCustomerMaterialsRequest!){
        validCustomerMaterials(request:\$input)
          {
            materials
        }
    }
    ''';
  }
}
