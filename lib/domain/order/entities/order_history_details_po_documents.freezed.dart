// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_po_documents.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PoDocuments {
  String get url => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PoDocumentsCopyWith<PoDocuments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoDocumentsCopyWith<$Res> {
  factory $PoDocumentsCopyWith(
          PoDocuments value, $Res Function(PoDocuments) then) =
      _$PoDocumentsCopyWithImpl<$Res, PoDocuments>;
  @useResult
  $Res call({String url, String name, String path});
}

/// @nodoc
class _$PoDocumentsCopyWithImpl<$Res, $Val extends PoDocuments>
    implements $PoDocumentsCopyWith<$Res> {
  _$PoDocumentsCopyWithImpl(this._value, this._then);

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
abstract class _$$_PoDocumentsCopyWith<$Res>
    implements $PoDocumentsCopyWith<$Res> {
  factory _$$_PoDocumentsCopyWith(
          _$_PoDocuments value, $Res Function(_$_PoDocuments) then) =
      __$$_PoDocumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String name, String path});
}

/// @nodoc
class __$$_PoDocumentsCopyWithImpl<$Res>
    extends _$PoDocumentsCopyWithImpl<$Res, _$_PoDocuments>
    implements _$$_PoDocumentsCopyWith<$Res> {
  __$$_PoDocumentsCopyWithImpl(
      _$_PoDocuments _value, $Res Function(_$_PoDocuments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? name = null,
    Object? path = null,
  }) {
    return _then(_$_PoDocuments(
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

class _$_PoDocuments extends _PoDocuments {
  _$_PoDocuments({required this.url, required this.name, required this.path})
      : super._();

  @override
  final String url;
  @override
  final String name;
  @override
  final String path;

  @override
  String toString() {
    return 'PoDocuments(url: $url, name: $name, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PoDocuments &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, name, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PoDocumentsCopyWith<_$_PoDocuments> get copyWith =>
      __$$_PoDocumentsCopyWithImpl<_$_PoDocuments>(this, _$identity);
}

abstract class _PoDocuments extends PoDocuments {
  factory _PoDocuments(
      {required final String url,
      required final String name,
      required final String path}) = _$_PoDocuments;
  _PoDocuments._() : super._();

  @override
  String get url;
  @override
  String get name;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$_PoDocumentsCopyWith<_$_PoDocuments> get copyWith =>
      throw _privateConstructorUsedError;
}
