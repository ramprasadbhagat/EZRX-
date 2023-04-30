// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_po_documents_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PoDocumentsDto _$PoDocumentsDtoFromJson(Map<String, dynamic> json) {
  return _PoDocumentsDto.fromJson(json);
}

/// @nodoc
mixin _$PoDocumentsDto {
  @JsonKey(name: 'url', defaultValue: '', readValue: _readUrl)
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '', readValue: _readName)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PoDocumentsDtoCopyWith<PoDocumentsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoDocumentsDtoCopyWith<$Res> {
  factory $PoDocumentsDtoCopyWith(
          PoDocumentsDto value, $Res Function(PoDocumentsDto) then) =
      _$PoDocumentsDtoCopyWithImpl<$Res, PoDocumentsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url', defaultValue: '', readValue: _readUrl)
          String url,
      @JsonKey(name: 'name', defaultValue: '', readValue: _readName)
          String name});
}

/// @nodoc
class _$PoDocumentsDtoCopyWithImpl<$Res, $Val extends PoDocumentsDto>
    implements $PoDocumentsDtoCopyWith<$Res> {
  _$PoDocumentsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PoDocumentsDtoCopyWith<$Res>
    implements $PoDocumentsDtoCopyWith<$Res> {
  factory _$$_PoDocumentsDtoCopyWith(
          _$_PoDocumentsDto value, $Res Function(_$_PoDocumentsDto) then) =
      __$$_PoDocumentsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url', defaultValue: '', readValue: _readUrl)
          String url,
      @JsonKey(name: 'name', defaultValue: '', readValue: _readName)
          String name});
}

/// @nodoc
class __$$_PoDocumentsDtoCopyWithImpl<$Res>
    extends _$PoDocumentsDtoCopyWithImpl<$Res, _$_PoDocumentsDto>
    implements _$$_PoDocumentsDtoCopyWith<$Res> {
  __$$_PoDocumentsDtoCopyWithImpl(
      _$_PoDocumentsDto _value, $Res Function(_$_PoDocumentsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? name = null,
  }) {
    return _then(_$_PoDocumentsDto(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PoDocumentsDto extends _PoDocumentsDto {
  const _$_PoDocumentsDto(
      {@JsonKey(name: 'url', defaultValue: '', readValue: _readUrl)
          required this.url,
      @JsonKey(name: 'name', defaultValue: '', readValue: _readName)
          required this.name})
      : super._();

  factory _$_PoDocumentsDto.fromJson(Map<String, dynamic> json) =>
      _$$_PoDocumentsDtoFromJson(json);

  @override
  @JsonKey(name: 'url', defaultValue: '', readValue: _readUrl)
  final String url;
  @override
  @JsonKey(name: 'name', defaultValue: '', readValue: _readName)
  final String name;

  @override
  String toString() {
    return 'PoDocumentsDto(url: $url, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PoDocumentsDto &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PoDocumentsDtoCopyWith<_$_PoDocumentsDto> get copyWith =>
      __$$_PoDocumentsDtoCopyWithImpl<_$_PoDocumentsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PoDocumentsDtoToJson(
      this,
    );
  }
}

abstract class _PoDocumentsDto extends PoDocumentsDto {
  const factory _PoDocumentsDto(
      {@JsonKey(name: 'url', defaultValue: '', readValue: _readUrl)
          required final String url,
      @JsonKey(name: 'name', defaultValue: '', readValue: _readName)
          required final String name}) = _$_PoDocumentsDto;
  const _PoDocumentsDto._() : super._();

  factory _PoDocumentsDto.fromJson(Map<String, dynamic> json) =
      _$_PoDocumentsDto.fromJson;

  @override
  @JsonKey(name: 'url', defaultValue: '', readValue: _readUrl)
  String get url;
  @override
  @JsonKey(name: 'name', defaultValue: '', readValue: _readName)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_PoDocumentsDtoCopyWith<_$_PoDocumentsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
