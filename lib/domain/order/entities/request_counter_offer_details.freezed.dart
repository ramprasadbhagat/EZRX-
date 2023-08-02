// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_counter_offer_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestCounterOfferDetails {
  CounterOfferValue get counterOfferPrice => throw _privateConstructorUsedError;
  Currency get counterOfferCurrency => throw _privateConstructorUsedError;
  StringValue get comment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestCounterOfferDetailsCopyWith<RequestCounterOfferDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCounterOfferDetailsCopyWith<$Res> {
  factory $RequestCounterOfferDetailsCopyWith(RequestCounterOfferDetails value,
          $Res Function(RequestCounterOfferDetails) then) =
      _$RequestCounterOfferDetailsCopyWithImpl<$Res,
          RequestCounterOfferDetails>;
  @useResult
  $Res call(
      {CounterOfferValue counterOfferPrice,
      Currency counterOfferCurrency,
      StringValue comment});
}

/// @nodoc
class _$RequestCounterOfferDetailsCopyWithImpl<$Res,
        $Val extends RequestCounterOfferDetails>
    implements $RequestCounterOfferDetailsCopyWith<$Res> {
  _$RequestCounterOfferDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counterOfferPrice = null,
    Object? counterOfferCurrency = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      counterOfferPrice: null == counterOfferPrice
          ? _value.counterOfferPrice
          : counterOfferPrice // ignore: cast_nullable_to_non_nullable
              as CounterOfferValue,
      counterOfferCurrency: null == counterOfferCurrency
          ? _value.counterOfferCurrency
          : counterOfferCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestCounterOfferDetailsCopyWith<$Res>
    implements $RequestCounterOfferDetailsCopyWith<$Res> {
  factory _$$_RequestCounterOfferDetailsCopyWith(
          _$_RequestCounterOfferDetails value,
          $Res Function(_$_RequestCounterOfferDetails) then) =
      __$$_RequestCounterOfferDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CounterOfferValue counterOfferPrice,
      Currency counterOfferCurrency,
      StringValue comment});
}

/// @nodoc
class __$$_RequestCounterOfferDetailsCopyWithImpl<$Res>
    extends _$RequestCounterOfferDetailsCopyWithImpl<$Res,
        _$_RequestCounterOfferDetails>
    implements _$$_RequestCounterOfferDetailsCopyWith<$Res> {
  __$$_RequestCounterOfferDetailsCopyWithImpl(
      _$_RequestCounterOfferDetails _value,
      $Res Function(_$_RequestCounterOfferDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counterOfferPrice = null,
    Object? counterOfferCurrency = null,
    Object? comment = null,
  }) {
    return _then(_$_RequestCounterOfferDetails(
      counterOfferPrice: null == counterOfferPrice
          ? _value.counterOfferPrice
          : counterOfferPrice // ignore: cast_nullable_to_non_nullable
              as CounterOfferValue,
      counterOfferCurrency: null == counterOfferCurrency
          ? _value.counterOfferCurrency
          : counterOfferCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_RequestCounterOfferDetails extends _RequestCounterOfferDetails {
  const _$_RequestCounterOfferDetails(
      {required this.counterOfferPrice,
      required this.counterOfferCurrency,
      required this.comment})
      : super._();

  @override
  final CounterOfferValue counterOfferPrice;
  @override
  final Currency counterOfferCurrency;
  @override
  final StringValue comment;

  @override
  String toString() {
    return 'RequestCounterOfferDetails(counterOfferPrice: $counterOfferPrice, counterOfferCurrency: $counterOfferCurrency, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestCounterOfferDetails &&
            (identical(other.counterOfferPrice, counterOfferPrice) ||
                other.counterOfferPrice == counterOfferPrice) &&
            (identical(other.counterOfferCurrency, counterOfferCurrency) ||
                other.counterOfferCurrency == counterOfferCurrency) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, counterOfferPrice, counterOfferCurrency, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestCounterOfferDetailsCopyWith<_$_RequestCounterOfferDetails>
      get copyWith => __$$_RequestCounterOfferDetailsCopyWithImpl<
          _$_RequestCounterOfferDetails>(this, _$identity);
}

abstract class _RequestCounterOfferDetails extends RequestCounterOfferDetails {
  const factory _RequestCounterOfferDetails(
      {required final CounterOfferValue counterOfferPrice,
      required final Currency counterOfferCurrency,
      required final StringValue comment}) = _$_RequestCounterOfferDetails;
  const _RequestCounterOfferDetails._() : super._();

  @override
  CounterOfferValue get counterOfferPrice;
  @override
  Currency get counterOfferCurrency;
  @override
  StringValue get comment;
  @override
  @JsonKey(ignore: true)
  _$$_RequestCounterOfferDetailsCopyWith<_$_RequestCounterOfferDetails>
      get copyWith => throw _privateConstructorUsedError;
}
