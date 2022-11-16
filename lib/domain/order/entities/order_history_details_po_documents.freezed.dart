// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_po_documents.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryDetailsPODocuments {
  String get url => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsPODocumentsCopyWith<OrderHistoryDetailsPODocuments>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsPODocumentsCopyWith<$Res> {
  factory $OrderHistoryDetailsPODocumentsCopyWith(
          OrderHistoryDetailsPODocuments value,
          $Res Function(OrderHistoryDetailsPODocuments) then) =
      _$OrderHistoryDetailsPODocumentsCopyWithImpl<$Res>;
  $Res call({String url, String name});
}

/// @nodoc
class _$OrderHistoryDetailsPODocumentsCopyWithImpl<$Res>
    implements $OrderHistoryDetailsPODocumentsCopyWith<$Res> {
  _$OrderHistoryDetailsPODocumentsCopyWithImpl(this._value, this._then);

  final OrderHistoryDetailsPODocuments _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryDetailsPODocuments) _then;

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
abstract class _$$_OrderHistoryDetailsPODocumentsCopyWith<$Res>
    implements $OrderHistoryDetailsPODocumentsCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsPODocumentsCopyWith(
          _$_OrderHistoryDetailsPODocuments value,
          $Res Function(_$_OrderHistoryDetailsPODocuments) then) =
      __$$_OrderHistoryDetailsPODocumentsCopyWithImpl<$Res>;
  @override
  $Res call({String url, String name});
}

/// @nodoc
class __$$_OrderHistoryDetailsPODocumentsCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsPODocumentsCopyWithImpl<$Res>
    implements _$$_OrderHistoryDetailsPODocumentsCopyWith<$Res> {
  __$$_OrderHistoryDetailsPODocumentsCopyWithImpl(
      _$_OrderHistoryDetailsPODocuments _value,
      $Res Function(_$_OrderHistoryDetailsPODocuments) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryDetailsPODocuments));

  @override
  _$_OrderHistoryDetailsPODocuments get _value =>
      super._value as _$_OrderHistoryDetailsPODocuments;

  @override
  $Res call({
    Object? url = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_OrderHistoryDetailsPODocuments(
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

class _$_OrderHistoryDetailsPODocuments
    extends _OrderHistoryDetailsPODocuments {
  _$_OrderHistoryDetailsPODocuments({required this.url, required this.name})
      : super._();

  @override
  final String url;
  @override
  final String name;

  @override
  String toString() {
    return 'OrderHistoryDetailsPODocuments(url: $url, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsPODocuments &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryDetailsPODocumentsCopyWith<_$_OrderHistoryDetailsPODocuments>
      get copyWith => __$$_OrderHistoryDetailsPODocumentsCopyWithImpl<
          _$_OrderHistoryDetailsPODocuments>(this, _$identity);
}

abstract class _OrderHistoryDetailsPODocuments
    extends OrderHistoryDetailsPODocuments {
  factory _OrderHistoryDetailsPODocuments(
      {required final String url,
      required final String name}) = _$_OrderHistoryDetailsPODocuments;
  _OrderHistoryDetailsPODocuments._() : super._();

  @override
  String get url;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsPODocumentsCopyWith<_$_OrderHistoryDetailsPODocuments>
      get copyWith => throw _privateConstructorUsedError;
}
