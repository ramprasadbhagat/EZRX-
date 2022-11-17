// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_po_documents_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryDetailsPODocumentsDto _$OrderHistoryDetailsPODocumentsDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsPODocumentsDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsPODocumentsDto {
  @JsonKey(name: 'Url', defaultValue: '')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsPODocumentsDtoCopyWith<OrderHistoryDetailsPODocumentsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsPODocumentsDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsPODocumentsDtoCopyWith(
          OrderHistoryDetailsPODocumentsDto value,
          $Res Function(OrderHistoryDetailsPODocumentsDto) then) =
      _$OrderHistoryDetailsPODocumentsDtoCopyWithImpl<$Res,
          OrderHistoryDetailsPODocumentsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Url', defaultValue: '') String url,
      @JsonKey(name: 'Name', defaultValue: '') String name});
}

/// @nodoc
class _$OrderHistoryDetailsPODocumentsDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsPODocumentsDto>
    implements $OrderHistoryDetailsPODocumentsDtoCopyWith<$Res> {
  _$OrderHistoryDetailsPODocumentsDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_OrderHistoryDetailsPODocumentsDtoCopyWith<$Res>
    implements $OrderHistoryDetailsPODocumentsDtoCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsPODocumentsDtoCopyWith(
          _$_OrderHistoryDetailsPODocumentsDto value,
          $Res Function(_$_OrderHistoryDetailsPODocumentsDto) then) =
      __$$_OrderHistoryDetailsPODocumentsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Url', defaultValue: '') String url,
      @JsonKey(name: 'Name', defaultValue: '') String name});
}

/// @nodoc
class __$$_OrderHistoryDetailsPODocumentsDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsPODocumentsDtoCopyWithImpl<$Res,
        _$_OrderHistoryDetailsPODocumentsDto>
    implements _$$_OrderHistoryDetailsPODocumentsDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsPODocumentsDtoCopyWithImpl(
      _$_OrderHistoryDetailsPODocumentsDto _value,
      $Res Function(_$_OrderHistoryDetailsPODocumentsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? name = null,
  }) {
    return _then(_$_OrderHistoryDetailsPODocumentsDto(
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
class _$_OrderHistoryDetailsPODocumentsDto
    extends _OrderHistoryDetailsPODocumentsDto {
  const _$_OrderHistoryDetailsPODocumentsDto(
      {@JsonKey(name: 'Url', defaultValue: '') required this.url,
      @JsonKey(name: 'Name', defaultValue: '') required this.name})
      : super._();

  factory _$_OrderHistoryDetailsPODocumentsDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsPODocumentsDtoFromJson(json);

  @override
  @JsonKey(name: 'Url', defaultValue: '')
  final String url;
  @override
  @JsonKey(name: 'Name', defaultValue: '')
  final String name;

  @override
  String toString() {
    return 'OrderHistoryDetailsPODocumentsDto(url: $url, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsPODocumentsDto &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryDetailsPODocumentsDtoCopyWith<
          _$_OrderHistoryDetailsPODocumentsDto>
      get copyWith => __$$_OrderHistoryDetailsPODocumentsDtoCopyWithImpl<
          _$_OrderHistoryDetailsPODocumentsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryDetailsPODocumentsDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsPODocumentsDto
    extends OrderHistoryDetailsPODocumentsDto {
  const factory _OrderHistoryDetailsPODocumentsDto(
      {@JsonKey(name: 'Url', defaultValue: '')
          required final String url,
      @JsonKey(name: 'Name', defaultValue: '')
          required final String name}) = _$_OrderHistoryDetailsPODocumentsDto;
  const _OrderHistoryDetailsPODocumentsDto._() : super._();

  factory _OrderHistoryDetailsPODocumentsDto.fromJson(
          Map<String, dynamic> json) =
      _$_OrderHistoryDetailsPODocumentsDto.fromJson;

  @override
  @JsonKey(name: 'Url', defaultValue: '')
  String get url;
  @override
  @JsonKey(name: 'Name', defaultValue: '')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsPODocumentsDtoCopyWith<
          _$_OrderHistoryDetailsPODocumentsDto>
      get copyWith => throw _privateConstructorUsedError;
}
