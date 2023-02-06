// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_information_sales_doc_credit_notes_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreditNotesDto _$CreditNotesDtoFromJson(Map<String, dynamic> json) {
  return _CreditNotesDto.fromJson(json);
}

/// @nodoc
mixin _$CreditNotesDto {
  @JsonKey(name: 'creditNoteId', defaultValue: '')
  String get creditNoteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'materials', defaultValue: [])
  List<MaterialsDto> get materials => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditNotesDtoCopyWith<CreditNotesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditNotesDtoCopyWith<$Res> {
  factory $CreditNotesDtoCopyWith(
          CreditNotesDto value, $Res Function(CreditNotesDto) then) =
      _$CreditNotesDtoCopyWithImpl<$Res, CreditNotesDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'creditNoteId', defaultValue: '')
          String creditNoteId,
      @JsonKey(name: 'materials', defaultValue: [])
          List<MaterialsDto> materials});
}

/// @nodoc
class _$CreditNotesDtoCopyWithImpl<$Res, $Val extends CreditNotesDto>
    implements $CreditNotesDtoCopyWith<$Res> {
  _$CreditNotesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditNoteId = null,
    Object? materials = null,
  }) {
    return _then(_value.copyWith(
      creditNoteId: null == creditNoteId
          ? _value.creditNoteId
          : creditNoteId // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreditNotesDtoCopyWith<$Res>
    implements $CreditNotesDtoCopyWith<$Res> {
  factory _$$_CreditNotesDtoCopyWith(
          _$_CreditNotesDto value, $Res Function(_$_CreditNotesDto) then) =
      __$$_CreditNotesDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'creditNoteId', defaultValue: '')
          String creditNoteId,
      @JsonKey(name: 'materials', defaultValue: [])
          List<MaterialsDto> materials});
}

/// @nodoc
class __$$_CreditNotesDtoCopyWithImpl<$Res>
    extends _$CreditNotesDtoCopyWithImpl<$Res, _$_CreditNotesDto>
    implements _$$_CreditNotesDtoCopyWith<$Res> {
  __$$_CreditNotesDtoCopyWithImpl(
      _$_CreditNotesDto _value, $Res Function(_$_CreditNotesDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditNoteId = null,
    Object? materials = null,
  }) {
    return _then(_$_CreditNotesDto(
      creditNoteId: null == creditNoteId
          ? _value.creditNoteId
          : creditNoteId // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreditNotesDto extends _CreditNotesDto {
  const _$_CreditNotesDto(
      {@JsonKey(name: 'creditNoteId', defaultValue: '')
          required this.creditNoteId,
      @JsonKey(name: 'materials', defaultValue: [])
          required final List<MaterialsDto> materials})
      : _materials = materials,
        super._();

  factory _$_CreditNotesDto.fromJson(Map<String, dynamic> json) =>
      _$$_CreditNotesDtoFromJson(json);

  @override
  @JsonKey(name: 'creditNoteId', defaultValue: '')
  final String creditNoteId;
  final List<MaterialsDto> _materials;
  @override
  @JsonKey(name: 'materials', defaultValue: [])
  List<MaterialsDto> get materials {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'CreditNotesDto(creditNoteId: $creditNoteId, materials: $materials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreditNotesDto &&
            (identical(other.creditNoteId, creditNoteId) ||
                other.creditNoteId == creditNoteId) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, creditNoteId,
      const DeepCollectionEquality().hash(_materials));

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

abstract class _CreditNotesDto extends CreditNotesDto {
  const factory _CreditNotesDto(
      {@JsonKey(name: 'creditNoteId', defaultValue: '')
          required final String creditNoteId,
      @JsonKey(name: 'materials', defaultValue: [])
          required final List<MaterialsDto> materials}) = _$_CreditNotesDto;
  const _CreditNotesDto._() : super._();

  factory _CreditNotesDto.fromJson(Map<String, dynamic> json) =
      _$_CreditNotesDto.fromJson;

  @override
  @JsonKey(name: 'creditNoteId', defaultValue: '')
  String get creditNoteId;
  @override
  @JsonKey(name: 'materials', defaultValue: [])
  List<MaterialsDto> get materials;
  @override
  @JsonKey(ignore: true)
  _$$_CreditNotesDtoCopyWith<_$_CreditNotesDto> get copyWith =>
      throw _privateConstructorUsedError;
}
