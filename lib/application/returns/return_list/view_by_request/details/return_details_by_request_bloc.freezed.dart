// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_details_by_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnDetailsByRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String returnId) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String returnId)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String returnId)? fetch,
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
abstract class $ReturnDetailsByRequestEventCopyWith<$Res> {
  factory $ReturnDetailsByRequestEventCopyWith(
          ReturnDetailsByRequestEvent value,
          $Res Function(ReturnDetailsByRequestEvent) then) =
      _$ReturnDetailsByRequestEventCopyWithImpl<$Res,
          ReturnDetailsByRequestEvent>;
}

/// @nodoc
class _$ReturnDetailsByRequestEventCopyWithImpl<$Res,
        $Val extends ReturnDetailsByRequestEvent>
    implements $ReturnDetailsByRequestEventCopyWith<$Res> {
  _$ReturnDetailsByRequestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ReturnDetailsByRequestEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'ReturnDetailsByRequestEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String returnId) fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String returnId)? fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String returnId)? fetch,
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

abstract class _Initialized implements ReturnDetailsByRequestEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({String returnId});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ReturnDetailsByRequestEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnId = null,
  }) {
    return _then(_$_Fetch(
      returnId: null == returnId
          ? _value.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.returnId});

  @override
  final String returnId;

  @override
  String toString() {
    return 'ReturnDetailsByRequestEvent.fetch(returnId: $returnId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.returnId, returnId) ||
                other.returnId == returnId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String returnId) fetch,
  }) {
    return fetch(returnId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String returnId)? fetch,
  }) {
    return fetch?.call(returnId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String returnId)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(returnId);
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

abstract class _Fetch implements ReturnDetailsByRequestEvent {
  const factory _Fetch({required final String returnId}) = _$_Fetch;

  String get returnId;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnDetailsByRequestState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<ReturnRequestInformation> get requestInformation =>
      throw _privateConstructorUsedError;
  ReturnRequestInformationHeader get requestInformationHeader =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnDetailsByRequestStateCopyWith<ReturnDetailsByRequestState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnDetailsByRequestStateCopyWith<$Res> {
  factory $ReturnDetailsByRequestStateCopyWith(
          ReturnDetailsByRequestState value,
          $Res Function(ReturnDetailsByRequestState) then) =
      _$ReturnDetailsByRequestStateCopyWithImpl<$Res,
          ReturnDetailsByRequestState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<ReturnRequestInformation> requestInformation,
      ReturnRequestInformationHeader requestInformationHeader});

  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader;
}

/// @nodoc
class _$ReturnDetailsByRequestStateCopyWithImpl<$Res,
        $Val extends ReturnDetailsByRequestState>
    implements $ReturnDetailsByRequestStateCopyWith<$Res> {
  _$ReturnDetailsByRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? requestInformation = null,
    Object? requestInformationHeader = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestInformation>,
      requestInformationHeader: null == requestInformationHeader
          ? _value.requestInformationHeader
          : requestInformationHeader // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformationHeader,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader {
    return $ReturnRequestInformationHeaderCopyWith<$Res>(
        _value.requestInformationHeader, (value) {
      return _then(_value.copyWith(requestInformationHeader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryDetailsStateCopyWith<$Res>
    implements $ReturnDetailsByRequestStateCopyWith<$Res> {
  factory _$$_ReturnSummaryDetailsStateCopyWith(
          _$_ReturnSummaryDetailsState value,
          $Res Function(_$_ReturnSummaryDetailsState) then) =
      __$$_ReturnSummaryDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<ReturnRequestInformation> requestInformation,
      ReturnRequestInformationHeader requestInformationHeader});

  @override
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader;
}

/// @nodoc
class __$$_ReturnSummaryDetailsStateCopyWithImpl<$Res>
    extends _$ReturnDetailsByRequestStateCopyWithImpl<$Res,
        _$_ReturnSummaryDetailsState>
    implements _$$_ReturnSummaryDetailsStateCopyWith<$Res> {
  __$$_ReturnSummaryDetailsStateCopyWithImpl(
      _$_ReturnSummaryDetailsState _value,
      $Res Function(_$_ReturnSummaryDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? requestInformation = null,
    Object? requestInformationHeader = null,
  }) {
    return _then(_$_ReturnSummaryDetailsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      requestInformation: null == requestInformation
          ? _value._requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestInformation>,
      requestInformationHeader: null == requestInformationHeader
          ? _value.requestInformationHeader
          : requestInformationHeader // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformationHeader,
    ));
  }
}

/// @nodoc

class _$_ReturnSummaryDetailsState implements _ReturnSummaryDetailsState {
  const _$_ReturnSummaryDetailsState(
      {required this.isLoading,
      required this.failureOrSuccessOption,
      required final List<ReturnRequestInformation> requestInformation,
      required this.requestInformationHeader})
      : _requestInformation = requestInformation;

  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final List<ReturnRequestInformation> _requestInformation;
  @override
  List<ReturnRequestInformation> get requestInformation {
    if (_requestInformation is EqualUnmodifiableListView)
      return _requestInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestInformation);
  }

  @override
  final ReturnRequestInformationHeader requestInformationHeader;

  @override
  String toString() {
    return 'ReturnDetailsByRequestState(isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption, requestInformation: $requestInformation, requestInformationHeader: $requestInformationHeader)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSummaryDetailsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._requestInformation, _requestInformation) &&
            (identical(
                    other.requestInformationHeader, requestInformationHeader) ||
                other.requestInformationHeader == requestInformationHeader));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_requestInformation),
      requestInformationHeader);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryDetailsStateCopyWith<_$_ReturnSummaryDetailsState>
      get copyWith => __$$_ReturnSummaryDetailsStateCopyWithImpl<
          _$_ReturnSummaryDetailsState>(this, _$identity);
}

abstract class _ReturnSummaryDetailsState
    implements ReturnDetailsByRequestState {
  const factory _ReturnSummaryDetailsState(
      {required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final List<ReturnRequestInformation> requestInformation,
      required final ReturnRequestInformationHeader
          requestInformationHeader}) = _$_ReturnSummaryDetailsState;

  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  List<ReturnRequestInformation> get requestInformation;
  @override
  ReturnRequestInformationHeader get requestInformationHeader;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryDetailsStateCopyWith<_$_ReturnSummaryDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
