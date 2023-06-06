// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_dropdown_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenericDropdownData {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenericDropdownDataCopyWith<GenericDropdownData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericDropdownDataCopyWith<$Res> {
  factory $GenericDropdownDataCopyWith(
          GenericDropdownData value, $Res Function(GenericDropdownData) then) =
      _$GenericDropdownDataCopyWithImpl<$Res, GenericDropdownData>;
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class _$GenericDropdownDataCopyWithImpl<$Res, $Val extends GenericDropdownData>
    implements $GenericDropdownDataCopyWith<$Res> {
  _$GenericDropdownDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenericDropdownDataCopyWith<$Res>
    implements $GenericDropdownDataCopyWith<$Res> {
  factory _$$_GenericDropdownDataCopyWith(_$_GenericDropdownData value,
          $Res Function(_$_GenericDropdownData) then) =
      __$$_GenericDropdownDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class __$$_GenericDropdownDataCopyWithImpl<$Res>
    extends _$GenericDropdownDataCopyWithImpl<$Res, _$_GenericDropdownData>
    implements _$$_GenericDropdownDataCopyWith<$Res> {
  __$$_GenericDropdownDataCopyWithImpl(_$_GenericDropdownData _value,
      $Res Function(_$_GenericDropdownData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
  }) {
    return _then(_$_GenericDropdownData(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GenericDropdownData extends _GenericDropdownData {
  _$_GenericDropdownData({required this.value, required this.label})
      : super._();

  @override
  final String value;
  @override
  final String label;

  @override
  String toString() {
    return 'GenericDropdownData(value: $value, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericDropdownData &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenericDropdownDataCopyWith<_$_GenericDropdownData> get copyWith =>
      __$$_GenericDropdownDataCopyWithImpl<_$_GenericDropdownData>(
          this, _$identity);
}

abstract class _GenericDropdownData extends GenericDropdownData {
  factory _GenericDropdownData(
      {required final String value,
      required final String label}) = _$_GenericDropdownData;
  _GenericDropdownData._() : super._();

  @override
  String get value;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$_GenericDropdownDataCopyWith<_$_GenericDropdownData> get copyWith =>
      throw _privateConstructorUsedError;
}
