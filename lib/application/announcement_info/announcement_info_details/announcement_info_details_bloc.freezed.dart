// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_info_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnnouncementInfoDetailsEvent {
  String get itemId => throw _privateConstructorUsedError;
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String itemId, SalesOrg salesOrg) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String itemId, SalesOrg salesOrg)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String itemId, SalesOrg salesOrg)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementInfoDetailsEventCopyWith<AnnouncementInfoDetailsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementInfoDetailsEventCopyWith<$Res> {
  factory $AnnouncementInfoDetailsEventCopyWith(
          AnnouncementInfoDetailsEvent value,
          $Res Function(AnnouncementInfoDetailsEvent) then) =
      _$AnnouncementInfoDetailsEventCopyWithImpl<$Res,
          AnnouncementInfoDetailsEvent>;
  @useResult
  $Res call({String itemId, SalesOrg salesOrg});
}

/// @nodoc
class _$AnnouncementInfoDetailsEventCopyWithImpl<$Res,
        $Val extends AnnouncementInfoDetailsEvent>
    implements $AnnouncementInfoDetailsEventCopyWith<$Res> {
  _$AnnouncementInfoDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? salesOrg = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res>
    implements $AnnouncementInfoDetailsEventCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String itemId, SalesOrg salesOrg});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$AnnouncementInfoDetailsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? salesOrg = null,
  }) {
    return _then(_$_Fetch(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.itemId, required this.salesOrg});

  @override
  final String itemId;
  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AnnouncementInfoDetailsEvent.fetch(itemId: $itemId, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String itemId, SalesOrg salesOrg) fetch,
  }) {
    return fetch(itemId, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String itemId, SalesOrg salesOrg)? fetch,
  }) {
    return fetch?.call(itemId, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String itemId, SalesOrg salesOrg)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(itemId, salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements AnnouncementInfoDetailsEvent {
  const factory _Fetch(
      {required final String itemId,
      required final SalesOrg salesOrg}) = _$_Fetch;

  @override
  String get itemId;
  @override
  SalesOrg get salesOrg;
  @override
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnouncementInfoDetailsState {
  AnnouncementInfoDetails get announcementInfoDetails =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementInfoDetailsStateCopyWith<AnnouncementInfoDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementInfoDetailsStateCopyWith<$Res> {
  factory $AnnouncementInfoDetailsStateCopyWith(
          AnnouncementInfoDetailsState value,
          $Res Function(AnnouncementInfoDetailsState) then) =
      _$AnnouncementInfoDetailsStateCopyWithImpl<$Res,
          AnnouncementInfoDetailsState>;
  @useResult
  $Res call(
      {AnnouncementInfoDetails announcementInfoDetails,
      bool isLoading,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $AnnouncementInfoDetailsCopyWith<$Res> get announcementInfoDetails;
}

/// @nodoc
class _$AnnouncementInfoDetailsStateCopyWithImpl<$Res,
        $Val extends AnnouncementInfoDetailsState>
    implements $AnnouncementInfoDetailsStateCopyWith<$Res> {
  _$AnnouncementInfoDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announcementInfoDetails = null,
    Object? isLoading = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      announcementInfoDetails: null == announcementInfoDetails
          ? _value.announcementInfoDetails
          : announcementInfoDetails // ignore: cast_nullable_to_non_nullable
              as AnnouncementInfoDetails,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnnouncementInfoDetailsCopyWith<$Res> get announcementInfoDetails {
    return $AnnouncementInfoDetailsCopyWith<$Res>(
        _value.announcementInfoDetails, (value) {
      return _then(_value.copyWith(announcementInfoDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnnouncementInfoDetailsStateCopyWith<$Res>
    implements $AnnouncementInfoDetailsStateCopyWith<$Res> {
  factory _$$_AnnouncementInfoDetailsStateCopyWith(
          _$_AnnouncementInfoDetailsState value,
          $Res Function(_$_AnnouncementInfoDetailsState) then) =
      __$$_AnnouncementInfoDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AnnouncementInfoDetails announcementInfoDetails,
      bool isLoading,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $AnnouncementInfoDetailsCopyWith<$Res> get announcementInfoDetails;
}

/// @nodoc
class __$$_AnnouncementInfoDetailsStateCopyWithImpl<$Res>
    extends _$AnnouncementInfoDetailsStateCopyWithImpl<$Res,
        _$_AnnouncementInfoDetailsState>
    implements _$$_AnnouncementInfoDetailsStateCopyWith<$Res> {
  __$$_AnnouncementInfoDetailsStateCopyWithImpl(
      _$_AnnouncementInfoDetailsState _value,
      $Res Function(_$_AnnouncementInfoDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announcementInfoDetails = null,
    Object? isLoading = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$_AnnouncementInfoDetailsState(
      announcementInfoDetails: null == announcementInfoDetails
          ? _value.announcementInfoDetails
          : announcementInfoDetails // ignore: cast_nullable_to_non_nullable
              as AnnouncementInfoDetails,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_AnnouncementInfoDetailsState extends _AnnouncementInfoDetailsState {
  const _$_AnnouncementInfoDetailsState(
      {required this.announcementInfoDetails,
      required this.isLoading,
      required this.apiFailureOrSuccessOption})
      : super._();

  @override
  final AnnouncementInfoDetails announcementInfoDetails;
  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'AnnouncementInfoDetailsState(announcementInfoDetails: $announcementInfoDetails, isLoading: $isLoading, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementInfoDetailsState &&
            (identical(
                    other.announcementInfoDetails, announcementInfoDetails) ||
                other.announcementInfoDetails == announcementInfoDetails) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, announcementInfoDetails,
      isLoading, apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementInfoDetailsStateCopyWith<_$_AnnouncementInfoDetailsState>
      get copyWith => __$$_AnnouncementInfoDetailsStateCopyWithImpl<
          _$_AnnouncementInfoDetailsState>(this, _$identity);
}

abstract class _AnnouncementInfoDetailsState
    extends AnnouncementInfoDetailsState {
  const factory _AnnouncementInfoDetailsState(
      {required final AnnouncementInfoDetails announcementInfoDetails,
      required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_AnnouncementInfoDetailsState;
  const _AnnouncementInfoDetailsState._() : super._();

  @override
  AnnouncementInfoDetails get announcementInfoDetails;
  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementInfoDetailsStateCopyWith<_$_AnnouncementInfoDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
