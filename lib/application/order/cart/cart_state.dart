part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    required List<PriceAggregate> cartItemList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
  }) = _CartState;

  factory CartState.initial() => CartState(
        cartItemList: <PriceAggregate>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
      );

  double get subtotal =>
      cartItemList.fold<double>(0, (sum, item) => sum + item.listPriceTotal);

  double get grandTotal =>
      cartItemList.fold<double>(0, (sum, item) => sum + item.unitPriceTotal);

  double get vatTotal => grandTotal - subtotal;

  int get zmgMaterialCount => cartItemList.fold<int>(
        0,
        (sum, item) => sum + (item.price.zmgDiscount ? item.quantity : 0),
      );

  bool get containFocMaterial =>
      cartItemList.any((e) => e.materialInfo.materialGroup4.isFOC);

  bool get containNonFocMaterial =>
      cartItemList.any((e) => !e.materialInfo.materialGroup4.isFOC);

  bool get containNonFocMaterialOT =>
      cartItemList.any((e) => !e.materialInfo.isFOCMaterial);

  bool get containSampleMaterial =>
      cartItemList.any((e) => e.materialInfo.isSampleMaterial);

  bool get containNonSampleMaterial =>
      cartItemList.any((element) => !element.materialInfo.isSampleMaterial);

  bool get containNonRegularMaterial => cartItemList.any((element) =>
      !element.materialInfo.isFOCMaterial ||
      !element.materialInfo.isSampleMaterial);

  String get dialogContent => containNonSampleMaterial
      ? 'non-sample'
      : containNonFocMaterialOT
          ? 'non-FOC'
          : containNonRegularMaterial
            ? 'only sample and/or FOC'
            : '';

  bool showDialog(OrderDocumentType orderType){
    return orderType.isZPFB ? containNonSampleMaterial
      : orderType.isZPFC ? containNonFocMaterialOT
      : orderType.isZPOR ?containNonRegularMaterial
          : false;
  }
}
