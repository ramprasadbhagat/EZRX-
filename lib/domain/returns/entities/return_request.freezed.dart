// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnRequest {
  bool get isSearchComplete => throw _privateConstructorUsedError;
  List<MaterialBasicInformation> get basicInformations =>
      throw _privateConstructorUsedError;
  List<ReturnItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnRequestCopyWith<ReturnRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestCopyWith<$Res> {
  factory $ReturnRequestCopyWith(
          ReturnRequest value, $Res Function(ReturnRequest) then) =
      _$ReturnRequestCopyWithImpl<$Res, ReturnRequest>;
  @useResult
  $Res call(
      {bool isSearchComplete,
      List<MaterialBasicInformation> basicInformations,
      List<ReturnItem> items});
}

/// @nodoc
class _$ReturnRequestCopyWithImpl<$Res, $Val extends ReturnRequest>
    implements $ReturnRequestCopyWith<$Res> {
  _$ReturnRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearchComplete = null,
    Object? basicInformations = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      isSearchComplete: null == isSearchComplete
          ? _value.isSearchComplete
          : isSearchComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      basicInformations: null == basicInformations
          ? _value.basicInformations
          : basicInformations // ignore: cast_nullable_to_non_nullable
              as List<MaterialBasicInformation>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnRequestCopyWith<$Res>
    implements $ReturnRequestCopyWith<$Res> {
  factory _$$_ReturnRequestCopyWith(
          _$_ReturnRequest value, $Res Function(_$_ReturnRequest) then) =
      __$$_ReturnRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearchComplete,
      List<MaterialBasicInformation> basicInformations,
      List<ReturnItem> items});
}

/// @nodoc
class __$$_ReturnRequestCopyWithImpl<$Res>
    extends _$ReturnRequestCopyWithImpl<$Res, _$_ReturnRequest>
    implements _$$_ReturnRequestCopyWith<$Res> {
  __$$_ReturnRequestCopyWithImpl(
      _$_ReturnRequest _value, $Res Function(_$_ReturnRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearchComplete = null,
    Object? basicInformations = null,
    Object? items = null,
  }) {
    return _then(_$_ReturnRequest(
      isSearchComplete: null == isSearchComplete
          ? _value.isSearchComplete
          : isSearchComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      basicInformations: null == basicInformations
          ? _value._basicInformations
          : basicInformations // ignore: cast_nullable_to_non_nullable
              as List<MaterialBasicInformation>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnItem>,
    ));
  }
}

/// @nodoc

class _$_ReturnRequest extends _ReturnRequest {
  const _$_ReturnRequest(
      {required this.isSearchComplete,
      required final List<MaterialBasicInformation> basicInformations,
      required final List<ReturnItem> items})
      : _basicInformations = basicInformations,
        _items = items,
        super._();

  @override
  final bool isSearchComplete;
  final List<MaterialBasicInformation> _basicInformations;
  @override
  List<MaterialBasicInformation> get basicInformations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basicInformations);
  }

  final List<ReturnItem> _items;
  @override
  List<ReturnItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ReturnRequest(isSearchComplete: $isSearchComplete, basicInformations: $basicInformations, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnRequest &&
            (identical(other.isSearchComplete, isSearchComplete) ||
                other.isSearchComplete == isSearchComplete) &&
            const DeepCollectionEquality()
                .equals(other._basicInformations, _basicInformations) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSearchComplete,
      const DeepCollectionEquality().hash(_basicInformations),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnRequestCopyWith<_$_ReturnRequest> get copyWith =>
      __$$_ReturnRequestCopyWithImpl<_$_ReturnRequest>(this, _$identity);
}

abstract class _ReturnRequest extends ReturnRequest {
  const factory _ReturnRequest(
      {required final bool isSearchComplete,
      required final List<MaterialBasicInformation> basicInformations,
      required final List<ReturnItem> items}) = _$_ReturnRequest;
  const _ReturnRequest._() : super._();

  @override
  bool get isSearchComplete;
  @override
  List<MaterialBasicInformation> get basicInformations;
  @override
  List<ReturnItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnRequestCopyWith<_$_ReturnRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
