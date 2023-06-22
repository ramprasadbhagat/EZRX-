// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentSummaryGroup {
  DateTimeStringValue get createdDate => throw _privateConstructorUsedError;
  List<PaymentSummaryDetails> get paymentSummaryDetails =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryGroupCopyWith<PaymentSummaryGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryGroupCopyWith<$Res> {
  factory $PaymentSummaryGroupCopyWith(
          PaymentSummaryGroup value, $Res Function(PaymentSummaryGroup) then) =
      _$PaymentSummaryGroupCopyWithImpl<$Res, PaymentSummaryGroup>;
  @useResult
  $Res call(
      {DateTimeStringValue createdDate,
      List<PaymentSummaryDetails> paymentSummaryDetails});
}

/// @nodoc
class _$PaymentSummaryGroupCopyWithImpl<$Res, $Val extends PaymentSummaryGroup>
    implements $PaymentSummaryGroupCopyWith<$Res> {
  _$PaymentSummaryGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? paymentSummaryDetails = null,
  }) {
    return _then(_value.copyWith(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      paymentSummaryDetails: null == paymentSummaryDetails
          ? _value.paymentSummaryDetails
          : paymentSummaryDetails // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentSummaryGroupCopyWith<$Res>
    implements $PaymentSummaryGroupCopyWith<$Res> {
  factory _$$_PaymentSummaryGroupCopyWith(_$_PaymentSummaryGroup value,
          $Res Function(_$_PaymentSummaryGroup) then) =
      __$$_PaymentSummaryGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue createdDate,
      List<PaymentSummaryDetails> paymentSummaryDetails});
}

/// @nodoc
class __$$_PaymentSummaryGroupCopyWithImpl<$Res>
    extends _$PaymentSummaryGroupCopyWithImpl<$Res, _$_PaymentSummaryGroup>
    implements _$$_PaymentSummaryGroupCopyWith<$Res> {
  __$$_PaymentSummaryGroupCopyWithImpl(_$_PaymentSummaryGroup _value,
      $Res Function(_$_PaymentSummaryGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDate = null,
    Object? paymentSummaryDetails = null,
  }) {
    return _then(_$_PaymentSummaryGroup(
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      paymentSummaryDetails: null == paymentSummaryDetails
          ? _value._paymentSummaryDetails
          : paymentSummaryDetails // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
    ));
  }
}

/// @nodoc

class _$_PaymentSummaryGroup implements _PaymentSummaryGroup {
  _$_PaymentSummaryGroup(
      {required this.createdDate,
      required final List<PaymentSummaryDetails> paymentSummaryDetails})
      : _paymentSummaryDetails = paymentSummaryDetails;

  @override
  final DateTimeStringValue createdDate;
  final List<PaymentSummaryDetails> _paymentSummaryDetails;
  @override
  List<PaymentSummaryDetails> get paymentSummaryDetails {
    if (_paymentSummaryDetails is EqualUnmodifiableListView)
      return _paymentSummaryDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentSummaryDetails);
  }

  @override
  String toString() {
    return 'PaymentSummaryGroup(createdDate: $createdDate, paymentSummaryDetails: $paymentSummaryDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentSummaryGroup &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            const DeepCollectionEquality()
                .equals(other._paymentSummaryDetails, _paymentSummaryDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdDate,
      const DeepCollectionEquality().hash(_paymentSummaryDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentSummaryGroupCopyWith<_$_PaymentSummaryGroup> get copyWith =>
      __$$_PaymentSummaryGroupCopyWithImpl<_$_PaymentSummaryGroup>(
          this, _$identity);
}

abstract class _PaymentSummaryGroup implements PaymentSummaryGroup {
  factory _PaymentSummaryGroup(
          {required final DateTimeStringValue createdDate,
          required final List<PaymentSummaryDetails> paymentSummaryDetails}) =
      _$_PaymentSummaryGroup;

  @override
  DateTimeStringValue get createdDate;
  @override
  List<PaymentSummaryDetails> get paymentSummaryDetails;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentSummaryGroupCopyWith<_$_PaymentSummaryGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
