part of 'soa_bloc.dart';

@freezed
class SoaState with _$SoaState {
  const factory SoaState({
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<Soa> soaList,
  }) = _SoaState;

  factory SoaState.initial() => SoaState(
        isFetching: false,
        failureOrSuccessOption: none(),
        soaList: <Soa>[],
      );
}
