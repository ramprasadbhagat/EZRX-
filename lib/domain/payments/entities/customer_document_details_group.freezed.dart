// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_document_details_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerDocumentDetailGroup {
  PrincipalName get principalName => throw _privateConstructorUsedError;
  List<CustomerDocumentDetail> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerDocumentDetailGroupCopyWith<CustomerDocumentDetailGroup>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDocumentDetailGroupCopyWith<$Res> {
  factory $CustomerDocumentDetailGroupCopyWith(
          CustomerDocumentDetailGroup value,
          $Res Function(CustomerDocumentDetailGroup) then) =
      _$CustomerDocumentDetailGroupCopyWithImpl<$Res,
          CustomerDocumentDetailGroup>;
  @useResult
  $Res call({PrincipalName principalName, List<CustomerDocumentDetail> items});
}

/// @nodoc
class _$CustomerDocumentDetailGroupCopyWithImpl<$Res,
        $Val extends CustomerDocumentDetailGroup>
    implements $CustomerDocumentDetailGroupCopyWith<$Res> {
  _$CustomerDocumentDetailGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principalName = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as PrincipalName,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerDocumentDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerDocumentDetailGroupCopyWith<$Res>
    implements $CustomerDocumentDetailGroupCopyWith<$Res> {
  factory _$$_CustomerDocumentDetailGroupCopyWith(
          _$_CustomerDocumentDetailGroup value,
          $Res Function(_$_CustomerDocumentDetailGroup) then) =
      __$$_CustomerDocumentDetailGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PrincipalName principalName, List<CustomerDocumentDetail> items});
}

/// @nodoc
class __$$_CustomerDocumentDetailGroupCopyWithImpl<$Res>
    extends _$CustomerDocumentDetailGroupCopyWithImpl<$Res,
        _$_CustomerDocumentDetailGroup>
    implements _$$_CustomerDocumentDetailGroupCopyWith<$Res> {
  __$$_CustomerDocumentDetailGroupCopyWithImpl(
      _$_CustomerDocumentDetailGroup _value,
      $Res Function(_$_CustomerDocumentDetailGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principalName = null,
    Object? items = null,
  }) {
    return _then(_$_CustomerDocumentDetailGroup(
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as PrincipalName,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerDocumentDetail>,
    ));
  }
}

/// @nodoc

class _$_CustomerDocumentDetailGroup implements _CustomerDocumentDetailGroup {
  _$_CustomerDocumentDetailGroup(
      {required this.principalName,
      required final List<CustomerDocumentDetail> items})
      : _items = items;

  @override
  final PrincipalName principalName;
  final List<CustomerDocumentDetail> _items;
  @override
  List<CustomerDocumentDetail> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CustomerDocumentDetailGroup(principalName: $principalName, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerDocumentDetailGroup &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, principalName, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerDocumentDetailGroupCopyWith<_$_CustomerDocumentDetailGroup>
      get copyWith => __$$_CustomerDocumentDetailGroupCopyWithImpl<
          _$_CustomerDocumentDetailGroup>(this, _$identity);
}

abstract class _CustomerDocumentDetailGroup
    implements CustomerDocumentDetailGroup {
  factory _CustomerDocumentDetailGroup(
          {required final PrincipalName principalName,
          required final List<CustomerDocumentDetail> items}) =
      _$_CustomerDocumentDetailGroup;

  @override
  PrincipalName get principalName;
  @override
  List<CustomerDocumentDetail> get items;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerDocumentDetailGroupCopyWith<_$_CustomerDocumentDetailGroup>
      get copyWith => throw _privateConstructorUsedError;
}
