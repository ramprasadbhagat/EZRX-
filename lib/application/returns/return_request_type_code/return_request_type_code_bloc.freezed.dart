// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request_type_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnRequestTypeCodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestTypeCodeEventCopyWith<$Res> {
  factory $ReturnRequestTypeCodeEventCopyWith(ReturnRequestTypeCodeEvent value,
          $Res Function(ReturnRequestTypeCodeEvent) then) =
      _$ReturnRequestTypeCodeEventCopyWithImpl<$Res,
          ReturnRequestTypeCodeEvent>;
}

/// @nodoc
class _$ReturnRequestTypeCodeEventCopyWithImpl<$Res,
        $Val extends ReturnRequestTypeCodeEvent>
    implements $ReturnRequestTypeCodeEventCopyWith<$Res> {
  _$ReturnRequestTypeCodeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ReturnRequestTypeCodeEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl();

  @override
  String toString() {
    return 'ReturnRequestTypeCodeEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ReturnRequestTypeCodeEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ReturnRequestTypeCodeEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_$FetchImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.salesOrganisation});

  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'ReturnRequestTypeCodeEvent.fetch(salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
  }) {
    return fetch(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
  }) {
    return fetch?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ReturnRequestTypeCodeEvent {
  const factory _Fetch({required final SalesOrganisation salesOrganisation}) =
      _$FetchImpl;

  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnRequestTypeCodeState {
  List<ReturnRequestTypeCodeDetails> get returnRequestTypeCodeDetailsList =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>>
      get returnRequestTypeCodeDetailsFailureOrSuccessOption =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnRequestTypeCodeStateCopyWith<ReturnRequestTypeCodeState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestTypeCodeStateCopyWith<$Res> {
  factory $ReturnRequestTypeCodeStateCopyWith(ReturnRequestTypeCodeState value,
          $Res Function(ReturnRequestTypeCodeState) then) =
      _$ReturnRequestTypeCodeStateCopyWithImpl<$Res,
          ReturnRequestTypeCodeState>;
  @useResult
  $Res call(
      {List<ReturnRequestTypeCodeDetails> returnRequestTypeCodeDetailsList,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>>
          returnRequestTypeCodeDetailsFailureOrSuccessOption});
}

/// @nodoc
class _$ReturnRequestTypeCodeStateCopyWithImpl<$Res,
        $Val extends ReturnRequestTypeCodeState>
    implements $ReturnRequestTypeCodeStateCopyWith<$Res> {
  _$ReturnRequestTypeCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnRequestTypeCodeDetailsList = null,
    Object? isFetching = null,
    Object? returnRequestTypeCodeDetailsFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      returnRequestTypeCodeDetailsList: null == returnRequestTypeCodeDetailsList
          ? _value.returnRequestTypeCodeDetailsList
          : returnRequestTypeCodeDetailsList // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestTypeCodeDetails>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      returnRequestTypeCodeDetailsFailureOrSuccessOption: null ==
              returnRequestTypeCodeDetailsFailureOrSuccessOption
          ? _value.returnRequestTypeCodeDetailsFailureOrSuccessOption
          : returnRequestTypeCodeDetailsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnRequestTypeCodeStateImplCopyWith<$Res>
    implements $ReturnRequestTypeCodeStateCopyWith<$Res> {
  factory _$$ReturnRequestTypeCodeStateImplCopyWith(
          _$ReturnRequestTypeCodeStateImpl value,
          $Res Function(_$ReturnRequestTypeCodeStateImpl) then) =
      __$$ReturnRequestTypeCodeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReturnRequestTypeCodeDetails> returnRequestTypeCodeDetailsList,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>>
          returnRequestTypeCodeDetailsFailureOrSuccessOption});
}

/// @nodoc
class __$$ReturnRequestTypeCodeStateImplCopyWithImpl<$Res>
    extends _$ReturnRequestTypeCodeStateCopyWithImpl<$Res,
        _$ReturnRequestTypeCodeStateImpl>
    implements _$$ReturnRequestTypeCodeStateImplCopyWith<$Res> {
  __$$ReturnRequestTypeCodeStateImplCopyWithImpl(
      _$ReturnRequestTypeCodeStateImpl _value,
      $Res Function(_$ReturnRequestTypeCodeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnRequestTypeCodeDetailsList = null,
    Object? isFetching = null,
    Object? returnRequestTypeCodeDetailsFailureOrSuccessOption = null,
  }) {
    return _then(_$ReturnRequestTypeCodeStateImpl(
      returnRequestTypeCodeDetailsList: null == returnRequestTypeCodeDetailsList
          ? _value._returnRequestTypeCodeDetailsList
          : returnRequestTypeCodeDetailsList // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestTypeCodeDetails>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      returnRequestTypeCodeDetailsFailureOrSuccessOption: null ==
              returnRequestTypeCodeDetailsFailureOrSuccessOption
          ? _value.returnRequestTypeCodeDetailsFailureOrSuccessOption
          : returnRequestTypeCodeDetailsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ReturnRequestTypeCodeStateImpl implements _ReturnRequestTypeCodeState {
  const _$ReturnRequestTypeCodeStateImpl(
      {required final List<ReturnRequestTypeCodeDetails>
          returnRequestTypeCodeDetailsList,
      required this.isFetching,
      required this.returnRequestTypeCodeDetailsFailureOrSuccessOption})
      : _returnRequestTypeCodeDetailsList = returnRequestTypeCodeDetailsList;

  final List<ReturnRequestTypeCodeDetails> _returnRequestTypeCodeDetailsList;
  @override
  List<ReturnRequestTypeCodeDetails> get returnRequestTypeCodeDetailsList {
    if (_returnRequestTypeCodeDetailsList is EqualUnmodifiableListView)
      return _returnRequestTypeCodeDetailsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnRequestTypeCodeDetailsList);
  }

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>>
      returnRequestTypeCodeDetailsFailureOrSuccessOption;

  @override
  String toString() {
    return 'ReturnRequestTypeCodeState(returnRequestTypeCodeDetailsList: $returnRequestTypeCodeDetailsList, isFetching: $isFetching, returnRequestTypeCodeDetailsFailureOrSuccessOption: $returnRequestTypeCodeDetailsFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnRequestTypeCodeStateImpl &&
            const DeepCollectionEquality().equals(
                other._returnRequestTypeCodeDetailsList,
                _returnRequestTypeCodeDetailsList) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.returnRequestTypeCodeDetailsFailureOrSuccessOption,
                    returnRequestTypeCodeDetailsFailureOrSuccessOption) ||
                other.returnRequestTypeCodeDetailsFailureOrSuccessOption ==
                    returnRequestTypeCodeDetailsFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_returnRequestTypeCodeDetailsList),
      isFetching,
      returnRequestTypeCodeDetailsFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnRequestTypeCodeStateImplCopyWith<_$ReturnRequestTypeCodeStateImpl>
      get copyWith => __$$ReturnRequestTypeCodeStateImplCopyWithImpl<
          _$ReturnRequestTypeCodeStateImpl>(this, _$identity);
}

abstract class _ReturnRequestTypeCodeState
    implements ReturnRequestTypeCodeState {
  const factory _ReturnRequestTypeCodeState(
          {required final List<ReturnRequestTypeCodeDetails>
              returnRequestTypeCodeDetailsList,
          required final bool isFetching,
          required final Option<Either<ApiFailure, dynamic>>
              returnRequestTypeCodeDetailsFailureOrSuccessOption}) =
      _$ReturnRequestTypeCodeStateImpl;

  @override
  List<ReturnRequestTypeCodeDetails> get returnRequestTypeCodeDetailsList;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>>
      get returnRequestTypeCodeDetailsFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$ReturnRequestTypeCodeStateImplCopyWith<_$ReturnRequestTypeCodeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
