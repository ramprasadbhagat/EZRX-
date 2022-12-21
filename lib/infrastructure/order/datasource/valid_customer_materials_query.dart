class ValidCustomMaterialQuery {
  String getValidCustomerMaterial() {
    return '''
      query validCustomerMaterials(\$request:validCustomerMaterialsRequest!){
        validCustomerMaterials(request:\$request)
          {
            materials
        }
    }
    ''';
  }
}
