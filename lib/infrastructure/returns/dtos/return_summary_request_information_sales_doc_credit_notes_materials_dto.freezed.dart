// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_information_sales_doc_credit_notes_materials_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialsDto _$MaterialsDtoFromJson(Map<String, dynamic> json) {
  return _CreditNotesDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialsDto {
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty', defaultValue: 0.0)
  double get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'value', defaultValue: 0.0)
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialsDtoCopyWith<MaterialsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialsDtoCopyWith<$Res> {
  factory $MaterialsDtoCopyWith(
          MaterialsDto value, $Res Function(MaterialsDto) then) =
      _$MaterialsDtoCopyWithImpl<$Res, MaterialsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '')
          String lineNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'qty', defaultValue: 0.0)
          double qty,
      @JsonKey(name: 'value', defaultValue: 0.0)
          double value});
}

/// @nodoc
class _$MaterialsDtoCopyWithImpl<$Res, $Val extends MaterialsDto>
    implements $MaterialsDtoCopyWith<$Res> {
  _$MaterialsDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_CreditNotesDtoCopyWith<$Res>
    implements $MaterialsDtoCopyWith<$Res> {
  factory _$$_CreditNotesDtoCopyWith(
          _$_CreditNotesDto value, $Res Function(_$_CreditNotesDto) then) =
      __$$_CreditNotesDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '')
          String lineNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'qty', defaultValue: 0.0)
          double qty,
      @JsonKey(name: 'value', defaultValue: 0.0)
          double value});
}

/// @nodoc
class __$$_CreditNotesDtoCopyWithImpl<$Res>
    extends _$MaterialsDtoCopyWithImpl<$Res, _$_CreditNotesDto>
    implements _$$_CreditNotesDtoCopyWith<$Res> {
  __$$_CreditNotesDtoCopyWithImpl(
      _$_CreditNotesDto _value, $Res Function(_$_CreditNotesDto) _then)
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
    return _then(_$_CreditNotesDto(
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
@JsonSerializable()
class _$_CreditNotesDto extends _CreditNotesDto {
  const _$_CreditNotesDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '')
          required this.lineNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'qty', defaultValue: 0.0)
          required this.qty,
      @JsonKey(name: 'value', defaultValue: 0.0)
          required this.value})
      : super._();

  factory _$_CreditNotesDto.fromJson(Map<String, dynamic> json) =>
      _$$_CreditNotesDtoFromJson(json);

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  final String lineNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'qty', defaultValue: 0.0)
  final double qty;
  @override
  @JsonKey(name: 'value', defaultValue: 0.0)
  final double value;

  @override
  String toString() {
    return 'MaterialsDto(materialNumber: $materialNumber, lineNumber: $lineNumber, materialDescription: $materialDescription, qty: $qty, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreditNotesDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, materialNumber, lineNumber, materialDescription, qty, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreditNotesDtoCopyWith<_$_CreditNotesDto> get copyWith =>
      __$$_CreditNotesDtoCopyWithImpl<_$_CreditNotesDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreditNotesDtoToJson(
      this,
    );
  }
}

abstract class _CreditNotesDto extends MaterialsDto {
  const factory _CreditNotesDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '')
          required final String lineNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required final String materialDescription,
      @JsonKey(name: 'qty', defaultValue: 0.0)
          required final double qty,
      @JsonKey(name: 'value', defaultValue: 0.0)
          required final double value}) = _$_CreditNotesDto;
  const _CreditNotesDto._() : super._();

  factory _CreditNotesDto.fromJson(Map<String, dynamic> json) =
      _$_CreditNotesDto.fromJson;

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'qty', defaultValue: 0.0)
  double get qty;
  @override
  @JsonKey(name: 'value', defaultValue: 0.0)
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$_CreditNotesDtoCopyWith<_$_CreditNotesDto> get copyWith =>
      throw _privateConstructorUsedError;
}
