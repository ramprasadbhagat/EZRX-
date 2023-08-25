part of 'product_detail_bloc.dart';

@freezed
class ProductDetailEvent with _$ProductDetailEvent {
  const factory ProductDetailEvent.initialized() = _Initialized;
  factory ProductDetailEvent.fetch({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
    required MaterialInfoType type,
  }) = _Fetch;

  factory ProductDetailEvent.fetchSimilarProduct({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
  }) = _FetchSimilarProduct;

  factory ProductDetailEvent.fetchMetaData({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
    required bool isForBundle,
  }) = _FetchMetaData;

  factory ProductDetailEvent.fetchStock({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
  }) = _FetchStock;

  factory ProductDetailEvent.fetchStockForBundle({
    required List<MaterialInfo> materials,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
  }) = _FetchStockForBundle;

  factory ProductDetailEvent.changeImage(int index) = _ChangeImage;

  factory ProductDetailEvent.addFavourite({
    required bool isForSimilarProduct,
    required MaterialNumber materialNumber,
  }) = _AddFavourite;

  factory ProductDetailEvent.deleteFavourite({
    required bool isForSimilarProduct,
    required MaterialNumber materialNumber,
  }) = _DeleteFavourite;
}
