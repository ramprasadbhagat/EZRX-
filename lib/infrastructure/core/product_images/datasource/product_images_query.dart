class ProductImagesQuery {
  String getProduct() {
    return '''
      query GetProductResponse(\$request: GetProductRequest!) {
        getProduct(request: \$request) {
          orderCloudProduct {
            materialID
            name
            description
            image
            thumbNail
            isFavourite
          }
          Items {
            PromotionMaterial
            HidePrice
            XP {
              Dosage
              HowToUse
              Composition
              DeliveryInstructions
              Usability
            }
          }
        }
      }
      ''';
  }
}
