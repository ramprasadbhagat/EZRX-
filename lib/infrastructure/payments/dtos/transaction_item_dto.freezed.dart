// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionItemDto _$TransactionItemDtoFromJson(Map<String, dynamic> json) {
  return _TransactionItemDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionItemDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference', defaultValue: '')
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentStatus', defaultValue: '')
  String get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountDue', defaultValue: 0)
  double get amountDue => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdOn', defaultValue: '')
  String get createdOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'paidOn', defaultValue: '')
  String get paidOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionItemDtoCopyWith<TransactionItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionItemDtoCopyWith<$Res> {
  factory $TransactionItemDtoCopyWith(
          TransactionItemDto value, $Res Function(TransactionItemDto) then) =
      _$TransactionItemDtoCopyWithImpl<$Res, TransactionItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'reference', defaultValue: '') String reference,
      @JsonKey(name: 'paymentStatus', defaultValue: '') String paymentStatus,
      @JsonKey(name: 'amountDue', defaultValue: 0) double amountDue,
      @JsonKey(name: 'createdOn', defaultValue: '') String createdOn,
      @JsonKey(name: 'paidOn', defaultValue: '') String paidOn});
}

/// @nodoc
class _$TransactionItemDtoCopyWithImpl<$Res, $Val extends TransactionItemDto>
    implements $TransactionItemDtoCopyWith<$Res> {
  _$TransactionItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? paymentStatus = null,
    Object? amountDue = null,
    Object? createdOn = null,
    Object? paidOn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      amountDue: null == amountDue
          ? _value.amountDue
          : amountDue // ignore: cast_nullable_to_non_nullable
              as double,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
      paidOn: null == paidOn
          ? _value.paidOn
          : paidOn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionItemDtoCopyWith<$Res>
    implements $TransactionItemDtoCopyWith<$Res> {
  factory _$$_TransactionItemDtoCopyWith(_$_TransactionItemDto value,
          $Res Function(_$_TransactionItemDto) then) =
      __$$_TransactionItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'reference', defaultValue: '') String reference,
      @JsonKey(name: 'paymentStatus', defaultValue: '') String paymentStatus,
      @JsonKey(name: 'amountDue', defaultValue: 0) double amountDue,
      @JsonKey(name: 'createdOn', defaultValue: '') String createdOn,
      @JsonKey(name: 'paidOn', defaultValue: '') String paidOn});
}

/// @nodoc
class __$$_TransactionItemDtoCopyWithImpl<$Res>
    extends _$TransactionItemDtoCopyWithImpl<$Res, _$_TransactionItemDto>
    implements _$$_TransactionItemDtoCopyWith<$Res> {
  __$$_TransactionItemDtoCopyWithImpl(
      _$_TransactionItemDto _value, $Res Function(_$_TransactionItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? paymentStatus = null,
    Object? amountDue = null,
    Object? createdOn = null,
    Object? paidOn = null,
  }) {
    return _then(_$_TransactionItemDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      amountDue: null == amountDue
          ? _value.amountDue
          : amountDue // ignore: cast_nullable_to_non_nullable
              as double,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
      paidOn: null == paidOn
          ? _value.paidOn
          : paidOn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionItemDto extends _TransactionItemDto {
  const _$_TransactionItemDto(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'reference', defaultValue: '') required this.reference,
      @JsonKey(name: 'paymentStatus', defaultValue: '')
      required this.paymentStatus,
      @JsonKey(name: 'amountDue', defaultValue: 0) required this.amountDue,
      @JsonKey(name: 'createdOn', defaultValue: '') required this.createdOn,
      @JsonKey(name: 'paidOn', defaultValue: '') required this.paidOn})
      : super._();

  factory _$_TransactionItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionItemDtoFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'reference', defaultValue: '')
  final String reference;
  @override
  @JsonKey(name: 'paymentStatus', defaultValue: '')
  final String paymentStatus;
  @override
  @JsonKey(name: 'amountDue', defaultValue: 0)
  final double amountDue;
  @override
  @JsonKey(name: 'createdOn', defaultValue: '')
  final String createdOn;
  @override
  @JsonKey(name: 'paidOn', defaultValue: '')
  final String paidOn;

  @override
  String toString() {
    return 'TransactionItemDto(id: $id, reference: $reference, paymentStatus: $paymentStatus, amountDue: $amountDue, createdOn: $createdOn, paidOn: $paidOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.amountDue, amountDue) ||
                other.amountDue == amountDue) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.paidOn, paidOn) || other.paidOn == paidOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, reference, paymentStatus, amountDue, createdOn, paidOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionItemDtoCopyWith<_$_TransactionItemDto> get copyWith =>
      __$$_TransactionItemDtoCopyWithImpl<_$_TransactionItemDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionItemDtoToJson(
      this,
    );
  }
}

abstract class _TransactionItemDto extends TransactionItemDto {
  const factory _TransactionItemDto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'reference', defaultValue: '')
      required final String reference,
      @JsonKey(name: 'paymentStatus', defaultValue: '')
      required final String paymentStatus,
      @JsonKey(name: 'amountDue', defaultValue: 0)
      required final double amountDue,
      @JsonKey(name: 'createdOn', defaultValue: '')
      required final String createdOn,
      @JsonKey(name: 'paidOn', defaultValue: '')
      required final String paidOn}) = _$_TransactionItemDto;
  const _TransactionItemDto._() : super._();

  factory _TransactionItemDto.fromJson(Map<String, dynamic> json) =
      _$_TransactionItemDto.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'reference', defaultValue: '')
  String get reference;
  @override
  @JsonKey(name: 'paymentStatus', defaultValue: '')
  String get paymentStatus;
  @override
  @JsonKey(name: 'amountDue', defaultValue: 0)
  double get amountDue;
  @override
  @JsonKey(name: 'createdOn', defaultValue: '')
  String get createdOn;
  @override
  @JsonKey(name: 'paidOn', defaultValue: '')
  String get paidOn;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionItemDtoCopyWith<_$_TransactionItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
