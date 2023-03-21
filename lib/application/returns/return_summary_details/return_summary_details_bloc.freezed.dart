// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnSummaryDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ReturnSummaryRequest returnSummaryRequests) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnSummaryRequest returnSummaryRequests)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnSummaryRequest returnSummaryRequests)? fetch,
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
abstract class $ReturnSummaryDetailsEventCopyWith<$Res> {
  factory $ReturnSummaryDetailsEventCopyWith(ReturnSummaryDetailsEvent value,
          $Res Function(ReturnSummaryDetailsEvent) then) =
      _$ReturnSummaryDetailsEventCopyWithImpl<$Res, ReturnSummaryDetailsEvent>;
}

/// @nodoc
class _$ReturnSummaryDetailsEventCopyWithImpl<$Res,
        $Val extends ReturnSummaryDetailsEvent>
    implements $ReturnSummaryDetailsEventCopyWith<$Res> {
  _$ReturnSummaryDetailsEventCopyWithImpl(this._value, this._then);

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
    extends _$ReturnSummaryDetailsEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'ReturnSummaryDetailsEvent.initialized()';
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
    required TResult Function(ReturnSummaryRequest returnSummaryRequests) fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnSummaryRequest returnSummaryRequests)? fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnSummaryRequest returnSummaryRequests)? fetch,
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

abstract class _Initialized implements ReturnSummaryDetailsEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnSummaryRequest returnSummaryRequests});

  $ReturnSummaryRequestCopyWith<$Res> get returnSummaryRequests;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ReturnSummaryDetailsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnSummaryRequests = null,
  }) {
    return _then(_$_Fetch(
      returnSummaryRequests: null == returnSummaryRequests
          ? _value.returnSummaryRequests
          : returnSummaryRequests // ignore: cast_nullable_to_non_nullable
              as ReturnSummaryRequest,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnSummaryRequestCopyWith<$Res> get returnSummaryRequests {
    return $ReturnSummaryRequestCopyWith<$Res>(_value.returnSummaryRequests,
        (value) {
      return _then(_value.copyWith(returnSummaryRequests: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.returnSummaryRequests});

  @override
  final ReturnSummaryRequest returnSummaryRequests;

  @override
  String toString() {
    return 'ReturnSummaryDetailsEvent.fetch(returnSummaryRequests: $returnSummaryRequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.returnSummaryRequests, returnSummaryRequests) ||
                other.returnSummaryRequests == returnSummaryRequests));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnSummaryRequests);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ReturnSummaryRequest returnSummaryRequests) fetch,
  }) {
    return fetch(returnSummaryRequests);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnSummaryRequest returnSummaryRequests)? fetch,
  }) {
    return fetch?.call(returnSummaryRequests);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnSummaryRequest returnSummaryRequests)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(returnSummaryRequests);
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

abstract class _Fetch implements ReturnSummaryDetailsEvent {
  const factory _Fetch(
      {required final ReturnSummaryRequest returnSummaryRequests}) = _$_Fetch;

  ReturnSummaryRequest get returnSummaryRequests;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnSummaryDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  ReturnSummaryRequest get returnSummaryRequests =>
      throw _privateConstructorUsedError;
  RequestInformation get requestInformation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnSummaryDetailsStateCopyWith<ReturnSummaryDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryDetailsStateCopyWith<$Res> {
  factory $ReturnSummaryDetailsStateCopyWith(ReturnSummaryDetailsState value,
          $Res Function(ReturnSummaryDetailsState) then) =
      _$ReturnSummaryDetailsStateCopyWithImpl<$Res, ReturnSummaryDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ReturnSummaryRequest returnSummaryRequests,
      RequestInformation requestInformation});

  $ReturnSummaryRequestCopyWith<$Res> get returnSummaryRequests;
  $RequestInformationCopyWith<$Res> get requestInformation;
}

/// @nodoc
class _$ReturnSummaryDetailsStateCopyWithImpl<$Res,
        $Val extends ReturnSummaryDetailsState>
    implements $ReturnSummaryDetailsStateCopyWith<$Res> {
  _$ReturnSummaryDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? returnSummaryRequests = null,
    Object? requestInformation = null,
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
      returnSummaryRequests: null == returnSummaryRequests
          ? _value.returnSummaryRequests
          : returnSummaryRequests // ignore: cast_nullable_to_non_nullable
              as ReturnSummaryRequest,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as RequestInformation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnSummaryRequestCopyWith<$Res> get returnSummaryRequests {
    return $ReturnSummaryRequestCopyWith<$Res>(_value.returnSummaryRequests,
        (value) {
      return _then(_value.copyWith(returnSummaryRequests: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestInformationCopyWith<$Res> get requestInformation {
    return $RequestInformationCopyWith<$Res>(_value.requestInformation,
        (value) {
      return _then(_value.copyWith(requestInformation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryDetailsStateCopyWith<$Res>
    implements $ReturnSummaryDetailsStateCopyWith<$Res> {
  factory _$$_ReturnSummaryDetailsStateCopyWith(
          _$_ReturnSummaryDetailsState value,
          $Res Function(_$_ReturnSummaryDetailsState) then) =
      __$$_ReturnSummaryDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ReturnSummaryRequest returnSummaryRequests,
      RequestInformation requestInformation});

  @override
  $ReturnSummaryRequestCopyWith<$Res> get returnSummaryRequests;
  @override
  $RequestInformationCopyWith<$Res> get requestInformation;
}

/// @nodoc
class __$$_ReturnSummaryDetailsStateCopyWithImpl<$Res>
    extends _$ReturnSummaryDetailsStateCopyWithImpl<$Res,
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
    Object? returnSummaryRequests = null,
    Object? requestInformation = null,
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
      returnSummaryRequests: null == returnSummaryRequests
          ? _value.returnSummaryRequests
          : returnSummaryRequests // ignore: cast_nullable_to_non_nullable
              as ReturnSummaryRequest,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as RequestInformation,
    ));
  }
}

/// @nodoc

class _$_ReturnSummaryDetailsState implements _ReturnSummaryDetailsState {
  const _$_ReturnSummaryDetailsState(
      {required this.isLoading,
      required this.failureOrSuccessOption,
      required this.returnSummaryRequests,
      required this.requestInformation});

  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final ReturnSummaryRequest returnSummaryRequests;
  @override
  final RequestInformation requestInformation;

  @override
  String toString() {
    return 'ReturnSummaryDetailsState(isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption, returnSummaryRequests: $returnSummaryRequests, requestInformation: $requestInformation)';
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
            (identical(other.returnSummaryRequests, returnSummaryRequests) ||
                other.returnSummaryRequests == returnSummaryRequests) &&
            (identical(other.requestInformation, requestInformation) ||
                other.requestInformation == requestInformation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      failureOrSuccessOption, returnSummaryRequests, requestInformation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryDetailsStateCopyWith<_$_ReturnSummaryDetailsState>
      get copyWith => __$$_ReturnSummaryDetailsStateCopyWithImpl<
          _$_ReturnSummaryDetailsState>(this, _$identity);
}

abstract class _ReturnSummaryDetailsState implements ReturnSummaryDetailsState {
  const factory _ReturnSummaryDetailsState(
      {required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final ReturnSummaryRequest returnSummaryRequests,
      required final RequestInformation
          requestInformation}) = _$_ReturnSummaryDetailsState;

  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  ReturnSummaryRequest get returnSummaryRequests;
  @override
  RequestInformation get requestInformation;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryDetailsStateCopyWith<_$_ReturnSummaryDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
