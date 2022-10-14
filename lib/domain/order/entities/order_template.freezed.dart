// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderTemplate {
  String get templateId => throw _privateConstructorUsedError;
  String get templateName => throw _privateConstructorUsedError;
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  Map<String, dynamic> get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderTemplateCopyWith<OrderTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTemplateCopyWith<$Res> {
  factory $OrderTemplateCopyWith(
          OrderTemplate value, $Res Function(OrderTemplate) then) =
      _$OrderTemplateCopyWithImpl<$Res>;
  $Res call(
      {String templateId,
      String templateName,
      List<CartItem> cartItems,
      Map<String, dynamic> user});
}

/// @nodoc
class _$OrderTemplateCopyWithImpl<$Res>
    implements $OrderTemplateCopyWith<$Res> {
  _$OrderTemplateCopyWithImpl(this._value, this._then);

  final OrderTemplate _value;
  // ignore: unused_field
  final $Res Function(OrderTemplate) _then;

  @override
  $Res call({
    Object? templateId = freezed,
    Object? templateName = freezed,
    Object? cartItems = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      templateId: templateId == freezed
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      templateName: templateName == freezed
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderTemplateCopyWith<$Res>
    implements $OrderTemplateCopyWith<$Res> {
  factory _$$_OrderTemplateCopyWith(
          _$_OrderTemplate value, $Res Function(_$_OrderTemplate) then) =
      __$$_OrderTemplateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String templateId,
      String templateName,
      List<CartItem> cartItems,
      Map<String, dynamic> user});
}

/// @nodoc
class __$$_OrderTemplateCopyWithImpl<$Res>
    extends _$OrderTemplateCopyWithImpl<$Res>
    implements _$$_OrderTemplateCopyWith<$Res> {
  __$$_OrderTemplateCopyWithImpl(
      _$_OrderTemplate _value, $Res Function(_$_OrderTemplate) _then)
      : super(_value, (v) => _then(v as _$_OrderTemplate));

  @override
  _$_OrderTemplate get _value => super._value as _$_OrderTemplate;

  @override
  $Res call({
    Object? templateId = freezed,
    Object? templateName = freezed,
    Object? cartItems = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_OrderTemplate(
      templateId: templateId == freezed
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      templateName: templateName == freezed
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      cartItems: cartItems == freezed
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      user: user == freezed
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_OrderTemplate extends _OrderTemplate {
  const _$_OrderTemplate(
      {required this.templateId,
      required this.templateName,
      required final List<CartItem> cartItems,
      required final Map<String, dynamic> user})
      : _cartItems = cartItems,
        _user = user,
        super._();

  @override
  final String templateId;
  @override
  final String templateName;
  final List<CartItem> _cartItems;
  @override
  List<CartItem> get cartItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  final Map<String, dynamic> _user;
  @override
  Map<String, dynamic> get user {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_user);
  }

  @override
  String toString() {
    return 'OrderTemplate(templateId: $templateId, templateName: $templateName, cartItems: $cartItems, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTemplate &&
            const DeepCollectionEquality()
                .equals(other.templateId, templateId) &&
            const DeepCollectionEquality()
                .equals(other.templateName, templateName) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            const DeepCollectionEquality().equals(other._user, _user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(templateId),
      const DeepCollectionEquality().hash(templateName),
      const DeepCollectionEquality().hash(_cartItems),
      const DeepCollectionEquality().hash(_user));

  @JsonKey(ignore: true)
  @override
  _$$_OrderTemplateCopyWith<_$_OrderTemplate> get copyWith =>
      __$$_OrderTemplateCopyWithImpl<_$_OrderTemplate>(this, _$identity);
}

abstract class _OrderTemplate extends OrderTemplate {
  const factory _OrderTemplate(
      {required final String templateId,
      required final String templateName,
      required final List<CartItem> cartItems,
      required final Map<String, dynamic> user}) = _$_OrderTemplate;
  const _OrderTemplate._() : super._();

  @override
  String get templateId;
  @override
  String get templateName;
  @override
  List<CartItem> get cartItems;
  @override
  Map<String, dynamic> get user;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTemplateCopyWith<_$_OrderTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}
