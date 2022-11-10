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
  @JsonKey(name: 'Url')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
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
      _$OrderHistoryDetailsPODocumentsDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Url') String url, @JsonKey(name: 'Name') String name});
}

/// @nodoc
class _$OrderHistoryDetailsPODocumentsDtoCopyWithImpl<$Res>
    implements $OrderHistoryDetailsPODocumentsDtoCopyWith<$Res> {
  _$OrderHistoryDetailsPODocumentsDtoCopyWithImpl(this._value, this._then);

  final OrderHistoryDetailsPODocumentsDto _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryDetailsPODocumentsDto) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
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
  $Res call(
      {@JsonKey(name: 'Url') String url, @JsonKey(name: 'Name') String name});
}

/// @nodoc
class __$$_OrderHistoryDetailsPODocumentsDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsPODocumentsDtoCopyWithImpl<$Res>
    implements _$$_OrderHistoryDetailsPODocumentsDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsPODocumentsDtoCopyWithImpl(
      _$_OrderHistoryDetailsPODocumentsDto _value,
      $Res Function(_$_OrderHistoryDetailsPODocumentsDto) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryDetailsPODocumentsDto));

  @override
  _$_OrderHistoryDetailsPODocumentsDto get _value =>
      super._value as _$_OrderHistoryDetailsPODocumentsDto;

  @override
  $Res call({
    Object? url = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_OrderHistoryDetailsPODocumentsDto(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
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
      {@JsonKey(name: 'Url') required this.url,
      @JsonKey(name: 'Name') required this.name})
      : super._();

  factory _$_OrderHistoryDetailsPODocumentsDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsPODocumentsDtoFromJson(json);

  @override
  @JsonKey(name: 'Url')
  final String url;
  @override
  @JsonKey(name: 'Name')
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
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
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
          {@JsonKey(name: 'Url') required final String url,
          @JsonKey(name: 'Name') required final String name}) =
      _$_OrderHistoryDetailsPODocumentsDto;
  const _OrderHistoryDetailsPODocumentsDto._() : super._();

  factory _OrderHistoryDetailsPODocumentsDto.fromJson(
          Map<String, dynamic> json) =
      _$_OrderHistoryDetailsPODocumentsDto.fromJson;

  @override
  @JsonKey(name: 'Url')
  String get url;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsPODocumentsDtoCopyWith<
          _$_OrderHistoryDetailsPODocumentsDto>
      get copyWith => throw _privateConstructorUsedError;
}
