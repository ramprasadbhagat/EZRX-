// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_information_sales_doc_credit_notes_materials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Materials {
  String get materialNumber => throw _privateConstructorUsedError;
  String get lineNumber => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  double get qty => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialsCopyWith<Materials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialsCopyWith<$Res> {
  factory $MaterialsCopyWith(Materials value, $Res Function(Materials) then) =
      _$MaterialsCopyWithImpl<$Res, Materials>;
  @useResult
  $Res call(
      {String materialNumber,
      String lineNumber,
      String materialDescription,
      double qty,
      double value});
}

/// @nodoc
class _$MaterialsCopyWithImpl<$Res, $Val extends Materials>
    implements $MaterialsCopyWith<$Res> {
  _$MaterialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? lineNumber = null,
    Object? materialDescription = null,
    Object? qty = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialsCopyWith<$Res> implements $MaterialsCopyWith<$Res> {
  factory _$$_MaterialsCopyWith(
          _$_Materials value, $Res Function(_$_Materials) then) =
      __$$_MaterialsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String materialNumber,
      String lineNumber,
      String materialDescription,
      double qty,
      double value});
}

/// @nodoc
class __$$_MaterialsCopyWithImpl<$Res>
    extends _$MaterialsCopyWithImpl<$Res, _$_Materials>
    implements _$$_MaterialsCopyWith<$Res> {
  __$$_MaterialsCopyWithImpl(
      _$_Materials _value, $Res Function(_$_Materials) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? lineNumber = null,
    Object? materialDescription = null,
    Object? qty = null,
    Object? value = null,
  }) {
    return _then(_$_Materials(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Materials extends _Materials {
  _$_Materials(
      {required this.materialNumber,
      required this.lineNumber,
      required this.materialDescription,
      required this.qty,
      required this.value})
      : super._();

  @override
  final String materialNumber;
  @override
  final String lineNumber;
  @override
  final String materialDescription;
  @override
  final double qty;
  @override
  final double value;

  @override
  String toString() {
    return 'Materials(materialNumber: $materialNumber, lineNumber: $lineNumber, materialDescription: $materialDescription, qty: $qty, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Materials &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, materialNumber, lineNumber, materialDescription, qty, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialsCopyWith<_$_Materials> get copyWith =>
      __$$_MaterialsCopyWithImpl<_$_Materials>(this, _$identity);
}

abstract class _Materials extends Materials {
  factory _Materials(
      {required final String materialNumber,
      required final String lineNumber,
      required final String materialDescription,
      required final double qty,
      required final double value}) = _$_Materials;
  _Materials._() : super._();

  @override
  String get materialNumber;
  @override
  String get lineNumber;
  @override
  String get materialDescription;
  @override
  double get qty;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialsCopyWith<_$_Materials> get copyWith =>
      throw _privateConstructorUsedError;
}
