// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_us_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactUsDetailsEvent {
  AppMarket get market => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? fetch,
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
  $ContactUsDetailsEventCopyWith<ContactUsDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsDetailsEventCopyWith<$Res> {
  factory $ContactUsDetailsEventCopyWith(ContactUsDetailsEvent value,
          $Res Function(ContactUsDetailsEvent) then) =
      _$ContactUsDetailsEventCopyWithImpl<$Res, ContactUsDetailsEvent>;
  @useResult
  $Res call({AppMarket market});
}

/// @nodoc
class _$ContactUsDetailsEventCopyWithImpl<$Res,
        $Val extends ContactUsDetailsEvent>
    implements $ContactUsDetailsEventCopyWith<$Res> {
  _$ContactUsDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = null,
  }) {
    return _then(_value.copyWith(
      market: null == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as AppMarket,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res>
    implements $ContactUsDetailsEventCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppMarket market});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ContactUsDetailsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = null,
  }) {
    return _then(_$_Fetch(
      market: null == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as AppMarket,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.market});

  @override
  final AppMarket market;

  @override
  String toString() {
    return 'ContactUsDetailsEvent.fetch(market: $market)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.market, market) || other.market == market));
  }

  @override
  int get hashCode => Object.hash(runtimeType, market);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) fetch,
  }) {
    return fetch(market);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? fetch,
  }) {
    return fetch?.call(market);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(market);
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

abstract class _Fetch implements ContactUsDetailsEvent {
  const factory _Fetch({required final AppMarket market}) = _$_Fetch;

  @override
  AppMarket get market;
  @override
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContactUsDetailsState {
  ContactUsDetails get contactUsDetails => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactUsDetailsStateCopyWith<ContactUsDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsDetailsStateCopyWith<$Res> {
  factory $ContactUsDetailsStateCopyWith(ContactUsDetailsState value,
          $Res Function(ContactUsDetailsState) then) =
      _$ContactUsDetailsStateCopyWithImpl<$Res, ContactUsDetailsState>;
  @useResult
  $Res call({ContactUsDetails contactUsDetails, bool isLoading});

  $ContactUsDetailsCopyWith<$Res> get contactUsDetails;
}

/// @nodoc
class _$ContactUsDetailsStateCopyWithImpl<$Res,
        $Val extends ContactUsDetailsState>
    implements $ContactUsDetailsStateCopyWith<$Res> {
  _$ContactUsDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUsDetails = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      contactUsDetails: null == contactUsDetails
          ? _value.contactUsDetails
          : contactUsDetails // ignore: cast_nullable_to_non_nullable
              as ContactUsDetails,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactUsDetailsCopyWith<$Res> get contactUsDetails {
    return $ContactUsDetailsCopyWith<$Res>(_value.contactUsDetails, (value) {
      return _then(_value.copyWith(contactUsDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ContactUsDetailsStateCopyWith<$Res>
    implements $ContactUsDetailsStateCopyWith<$Res> {
  factory _$$_ContactUsDetailsStateCopyWith(_$_ContactUsDetailsState value,
          $Res Function(_$_ContactUsDetailsState) then) =
      __$$_ContactUsDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContactUsDetails contactUsDetails, bool isLoading});

  @override
  $ContactUsDetailsCopyWith<$Res> get contactUsDetails;
}

/// @nodoc
class __$$_ContactUsDetailsStateCopyWithImpl<$Res>
    extends _$ContactUsDetailsStateCopyWithImpl<$Res, _$_ContactUsDetailsState>
    implements _$$_ContactUsDetailsStateCopyWith<$Res> {
  __$$_ContactUsDetailsStateCopyWithImpl(_$_ContactUsDetailsState _value,
      $Res Function(_$_ContactUsDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUsDetails = null,
    Object? isLoading = null,
  }) {
    return _then(_$_ContactUsDetailsState(
      contactUsDetails: null == contactUsDetails
          ? _value.contactUsDetails
          : contactUsDetails // ignore: cast_nullable_to_non_nullable
              as ContactUsDetails,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ContactUsDetailsState extends _ContactUsDetailsState {
  const _$_ContactUsDetailsState(
      {required this.contactUsDetails, required this.isLoading})
      : super._();

  @override
  final ContactUsDetails contactUsDetails;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ContactUsDetailsState(contactUsDetails: $contactUsDetails, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactUsDetailsState &&
            (identical(other.contactUsDetails, contactUsDetails) ||
                other.contactUsDetails == contactUsDetails) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contactUsDetails, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactUsDetailsStateCopyWith<_$_ContactUsDetailsState> get copyWith =>
      __$$_ContactUsDetailsStateCopyWithImpl<_$_ContactUsDetailsState>(
          this, _$identity);
}

abstract class _ContactUsDetailsState extends ContactUsDetailsState {
  const factory _ContactUsDetailsState(
      {required final ContactUsDetails contactUsDetails,
      required final bool isLoading}) = _$_ContactUsDetailsState;
  const _ContactUsDetailsState._() : super._();

  @override
  ContactUsDetails get contactUsDetails;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ContactUsDetailsStateCopyWith<_$_ContactUsDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
