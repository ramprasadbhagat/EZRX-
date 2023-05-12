// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_item_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnItemDetails {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  String get itemNumber => throw _privateConstructorUsedError;
  String get batch => throw _privateConstructorUsedError;
  ReturnQuantity get returnQuantity => throw _privateConstructorUsedError;
  Usage get usage => throw _privateConstructorUsedError;
  List<String> get poDocuments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnItemDetailsCopyWith<ReturnItemDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnItemDetailsCopyWith<$Res> {
  factory $ReturnItemDetailsCopyWith(
          ReturnItemDetails value, $Res Function(ReturnItemDetails) then) =
      _$ReturnItemDetailsCopyWithImpl<$Res, ReturnItemDetails>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      String itemNumber,
      String batch,
      ReturnQuantity returnQuantity,
      Usage usage,
      List<String> poDocuments});

  $UsageCopyWith<$Res> get usage;
}

/// @nodoc
class _$ReturnItemDetailsCopyWithImpl<$Res, $Val extends ReturnItemDetails>
    implements $ReturnItemDetailsCopyWith<$Res> {
  _$ReturnItemDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? itemNumber = null,
    Object? batch = null,
    Object? returnQuantity = null,
    Object? usage = null,
    Object? poDocuments = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      returnQuantity: null == returnQuantity
          ? _value.returnQuantity
          : returnQuantity // ignore: cast_nullable_to_non_nullable
              as ReturnQuantity,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
      poDocuments: null == poDocuments
          ? _value.poDocuments
          : poDocuments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsageCopyWith<$Res> get usage {
    return $UsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReturnItemDetailsCopyWith<$Res>
    implements $ReturnItemDetailsCopyWith<$Res> {
  factory _$$_ReturnItemDetailsCopyWith(_$_ReturnItemDetails value,
          $Res Function(_$_ReturnItemDetails) then) =
      __$$_ReturnItemDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      String itemNumber,
      String batch,
      ReturnQuantity returnQuantity,
      Usage usage,
      List<String> poDocuments});

  @override
  $UsageCopyWith<$Res> get usage;
}

/// @nodoc
class __$$_ReturnItemDetailsCopyWithImpl<$Res>
    extends _$ReturnItemDetailsCopyWithImpl<$Res, _$_ReturnItemDetails>
    implements _$$_ReturnItemDetailsCopyWith<$Res> {
  __$$_ReturnItemDetailsCopyWithImpl(
      _$_ReturnItemDetails _value, $Res Function(_$_ReturnItemDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? itemNumber = null,
    Object? batch = null,
    Object? returnQuantity = null,
    Object? usage = null,
    Object? poDocuments = null,
  }) {
    return _then(_$_ReturnItemDetails(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      returnQuantity: null == returnQuantity
          ? _value.returnQuantity
          : returnQuantity // ignore: cast_nullable_to_non_nullable
              as ReturnQuantity,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
      poDocuments: null == poDocuments
          ? _value._poDocuments
          : poDocuments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_ReturnItemDetails extends _ReturnItemDetails {
  const _$_ReturnItemDetails(
      {required this.materialNumber,
      required this.itemNumber,
      required this.batch,
      required this.returnQuantity,
      required this.usage,
      required final List<String> poDocuments})
      : _poDocuments = poDocuments,
        super._();

  @override
  final MaterialNumber materialNumber;
  @override
  final String itemNumber;
  @override
  final String batch;
  @override
  final ReturnQuantity returnQuantity;
  @override
  final Usage usage;
  final List<String> _poDocuments;
  @override
  List<String> get poDocuments {
    if (_poDocuments is EqualUnmodifiableListView) return _poDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poDocuments);
  }

  @override
  String toString() {
    return 'ReturnItemDetails(materialNumber: $materialNumber, itemNumber: $itemNumber, batch: $batch, returnQuantity: $returnQuantity, usage: $usage, poDocuments: $poDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnItemDetails &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.itemNumber, itemNumber) ||
                other.itemNumber == itemNumber) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.returnQuantity, returnQuantity) ||
                other.returnQuantity == returnQuantity) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            const DeepCollectionEquality()
                .equals(other._poDocuments, _poDocuments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialNumber,
      itemNumber,
      batch,
      returnQuantity,
      usage,
      const DeepCollectionEquality().hash(_poDocuments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnItemDetailsCopyWith<_$_ReturnItemDetails> get copyWith =>
      __$$_ReturnItemDetailsCopyWithImpl<_$_ReturnItemDetails>(
          this, _$identity);
}

abstract class _ReturnItemDetails extends ReturnItemDetails {
  const factory _ReturnItemDetails(
      {required final MaterialNumber materialNumber,
      required final String itemNumber,
      required final String batch,
      required final ReturnQuantity returnQuantity,
      required final Usage usage,
      required final List<String> poDocuments}) = _$_ReturnItemDetails;
  const _ReturnItemDetails._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  String get itemNumber;
  @override
  String get batch;
  @override
  ReturnQuantity get returnQuantity;
  @override
  Usage get usage;
  @override
  List<String> get poDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnItemDetailsCopyWith<_$_ReturnItemDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
