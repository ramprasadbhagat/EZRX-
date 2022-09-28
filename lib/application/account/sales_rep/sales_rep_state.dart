part of 'sales_rep_bloc.dart';

@freezed
class SalesRepState with _$SalesRepState {
  const factory SalesRepState({
    required SalesRepresentativeInfo salesRepInfo,
    required Option<Either<ApiFailure, dynamic>> salesRepFailureOrSuccessOption,
  }) = _SalesRepState;

  factory SalesRepState.initial() => SalesRepState(
        salesRepInfo: SalesRepresentativeInfo.empty(),
        salesRepFailureOrSuccessOption: none(),
      );
}
