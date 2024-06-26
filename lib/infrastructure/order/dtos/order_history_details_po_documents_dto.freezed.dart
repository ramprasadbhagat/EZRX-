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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoDocumentsDto _$PoDocumentsDtoFromJson(Map<String, dynamic> json) {
  return _PoDocumentsDto.fromJson(json);
}

/// @nodoc
mixin _$PoDocumentsDto {
  @JsonKey(
      name: 'url', defaultValue: '', readValue: JsonReadValueHelper.readUrl)
  String get url => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'name',
      defaultValue: '',
      readValue: JsonReadValueHelper.readFileName)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'path', defaultValue: '', readValue: JsonReadValueHelper.readUrl)
  String get path => throw _privateConstructorUsedError;

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
      {@JsonKey(
          name: 'url', defaultValue: '', readValue: JsonReadValueHelper.readUrl)
      String url,
      @JsonKey(
          name: 'name',
          defaultValue: '',
          readValue: JsonReadValueHelper.readFileName)
      String name,
      @JsonKey(
          name: 'path',
          defaultValue: '',
          readValue: JsonReadValueHelper.readUrl)
      String path});
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
    Object? path = null,
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
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoDocumentsDtoImplCopyWith<$Res>
    implements $PoDocumentsDtoCopyWith<$Res> {
  factory _$$PoDocumentsDtoImplCopyWith(_$PoDocumentsDtoImpl value,
          $Res Function(_$PoDocumentsDtoImpl) then) =
      __$$PoDocumentsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'url', defaultValue: '', readValue: JsonReadValueHelper.readUrl)
      String url,
      @JsonKey(
          name: 'name',
          defaultValue: '',
          readValue: JsonReadValueHelper.readFileName)
      String name,
      @JsonKey(
          name: 'path',
          defaultValue: '',
          readValue: JsonReadValueHelper.readUrl)
      String path});
}

/// @nodoc
class __$$PoDocumentsDtoImplCopyWithImpl<$Res>
    extends _$PoDocumentsDtoCopyWithImpl<$Res, _$PoDocumentsDtoImpl>
    implements _$$PoDocumentsDtoImplCopyWith<$Res> {
  __$$PoDocumentsDtoImplCopyWithImpl(
      _$PoDocumentsDtoImpl _value, $Res Function(_$PoDocumentsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? name = null,
    Object? path = null,
  }) {
    return _then(_$PoDocumentsDtoImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoDocumentsDtoImpl extends _PoDocumentsDto {
  const _$PoDocumentsDtoImpl(
      {@JsonKey(
          name: 'url', defaultValue: '', readValue: JsonReadValueHelper.readUrl)
      required this.url,
      @JsonKey(
          name: 'name',
          defaultValue: '',
          readValue: JsonReadValueHelper.readFileName)
      required this.name,
      @JsonKey(
          name: 'path',
          defaultValue: '',
          readValue: JsonReadValueHelper.readUrl)
      required this.path})
      : super._();

  factory _$PoDocumentsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoDocumentsDtoImplFromJson(json);

  @override
  @JsonKey(
      name: 'url', defaultValue: '', readValue: JsonReadValueHelper.readUrl)
  final String url;
  @override
  @JsonKey(
      name: 'name',
      defaultValue: '',
      readValue: JsonReadValueHelper.readFileName)
  final String name;
  @override
  @JsonKey(
      name: 'path', defaultValue: '', readValue: JsonReadValueHelper.readUrl)
  final String path;

  @override
  String toString() {
    return 'PoDocumentsDto(url: $url, name: $name, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoDocumentsDtoImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, name, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PoDocumentsDtoImplCopyWith<_$PoDocumentsDtoImpl> get copyWith =>
      __$$PoDocumentsDtoImplCopyWithImpl<_$PoDocumentsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoDocumentsDtoImplToJson(
      this,
    );
  }
}

abstract class _PoDocumentsDto extends PoDocumentsDto {
  const factory _PoDocumentsDto(
      {@JsonKey(
          name: 'url', defaultValue: '', readValue: JsonReadValueHelper.readUrl)
      required final String url,
      @JsonKey(
          name: 'name',
          defaultValue: '',
          readValue: JsonReadValueHelper.readFileName)
      required final String name,
      @JsonKey(
          name: 'path',
          defaultValue: '',
          readValue: JsonReadValueHelper.readUrl)
      required final String path}) = _$PoDocumentsDtoImpl;
  const _PoDocumentsDto._() : super._();

  factory _PoDocumentsDto.fromJson(Map<String, dynamic> json) =
      _$PoDocumentsDtoImpl.fromJson;

  @override
  @JsonKey(
      name: 'url', defaultValue: '', readValue: JsonReadValueHelper.readUrl)
  String get url;
  @override
  @JsonKey(
      name: 'name',
      defaultValue: '',
      readValue: JsonReadValueHelper.readFileName)
  String get name;
  @override
  @JsonKey(
      name: 'path', defaultValue: '', readValue: JsonReadValueHelper.readUrl)
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$PoDocumentsDtoImplCopyWith<_$PoDocumentsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
