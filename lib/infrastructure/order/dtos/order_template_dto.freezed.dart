// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_template_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderTemplateDto _$OrderTemplateDtoFromJson(Map<String, dynamic> json) {
  return _OrderTemplateDto.fromJson(json);
}

/// @nodoc
mixin _$OrderTemplateDto {
  @JsonKey(name: 'id')
  String get templateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get templateName =>
      throw _privateConstructorUsedError; // TODO: use UserDto someday
  @JsonKey(name: 'user', defaultValue: <String, dynamic>{})
  Map<String, dynamic> get user =>
      throw _privateConstructorUsedError; // TODO: by right we no need this
  @_CartItemListConverter()
  @JsonKey(name: 'cartList', defaultValue: <CartItemDto>[])
  List<CartItemDto> get cartItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTemplateDtoCopyWith<OrderTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTemplateDtoCopyWith<$Res> {
  factory $OrderTemplateDtoCopyWith(
          OrderTemplateDto value, $Res Function(OrderTemplateDto) then) =
      _$OrderTemplateDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          String templateId,
      @JsonKey(name: 'name', defaultValue: '')
          String templateName,
      @JsonKey(name: 'user', defaultValue: <String, dynamic>{})
          Map<String, dynamic> user,
      @_CartItemListConverter()
      @JsonKey(name: 'cartList', defaultValue: <CartItemDto>[])
          List<CartItemDto> cartItems});
}

/// @nodoc
class _$OrderTemplateDtoCopyWithImpl<$Res>
    implements $OrderTemplateDtoCopyWith<$Res> {
  _$OrderTemplateDtoCopyWithImpl(this._value, this._then);

  final OrderTemplateDto _value;
  // ignore: unused_field
  final $Res Function(OrderTemplateDto) _then;

  @override
  $Res call({
    Object? templateId = freezed,
    Object? templateName = freezed,
    Object? user = freezed,
    Object? cartItems = freezed,
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
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItemDto>,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderTemplateDtoCopyWith<$Res>
    implements $OrderTemplateDtoCopyWith<$Res> {
  factory _$$_OrderTemplateDtoCopyWith(
          _$_OrderTemplateDto value, $Res Function(_$_OrderTemplateDto) then) =
      __$$_OrderTemplateDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id')
          String templateId,
      @JsonKey(name: 'name', defaultValue: '')
          String templateName,
      @JsonKey(name: 'user', defaultValue: <String, dynamic>{})
          Map<String, dynamic> user,
      @_CartItemListConverter()
      @JsonKey(name: 'cartList', defaultValue: <CartItemDto>[])
          List<CartItemDto> cartItems});
}

/// @nodoc
class __$$_OrderTemplateDtoCopyWithImpl<$Res>
    extends _$OrderTemplateDtoCopyWithImpl<$Res>
    implements _$$_OrderTemplateDtoCopyWith<$Res> {
  __$$_OrderTemplateDtoCopyWithImpl(
      _$_OrderTemplateDto _value, $Res Function(_$_OrderTemplateDto) _then)
      : super(_value, (v) => _then(v as _$_OrderTemplateDto));

  @override
  _$_OrderTemplateDto get _value => super._value as _$_OrderTemplateDto;

  @override
  $Res call({
    Object? templateId = freezed,
    Object? templateName = freezed,
    Object? user = freezed,
    Object? cartItems = freezed,
  }) {
    return _then(_$_OrderTemplateDto(
      templateId: templateId == freezed
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      templateName: templateName == freezed
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      cartItems: cartItems == freezed
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderTemplateDto extends _OrderTemplateDto {
  const _$_OrderTemplateDto(
      {@JsonKey(name: 'id')
          required this.templateId,
      @JsonKey(name: 'name', defaultValue: '')
          required this.templateName,
      @JsonKey(name: 'user', defaultValue: <String, dynamic>{})
          required final Map<String, dynamic> user,
      @_CartItemListConverter()
      @JsonKey(name: 'cartList', defaultValue: <CartItemDto>[])
          required final List<CartItemDto> cartItems})
      : _user = user,
        _cartItems = cartItems,
        super._();

  factory _$_OrderTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$$_OrderTemplateDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String templateId;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String templateName;
// TODO: use UserDto someday
  final Map<String, dynamic> _user;
// TODO: use UserDto someday
  @override
  @JsonKey(name: 'user', defaultValue: <String, dynamic>{})
  Map<String, dynamic> get user {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_user);
  }

// TODO: by right we no need this
  final List<CartItemDto> _cartItems;
// TODO: by right we no need this
  @override
  @_CartItemListConverter()
  @JsonKey(name: 'cartList', defaultValue: <CartItemDto>[])
  List<CartItemDto> get cartItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  String toString() {
    return 'OrderTemplateDto(templateId: $templateId, templateName: $templateName, user: $user, cartItems: $cartItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTemplateDto &&
            const DeepCollectionEquality()
                .equals(other.templateId, templateId) &&
            const DeepCollectionEquality()
                .equals(other.templateName, templateName) &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(templateId),
      const DeepCollectionEquality().hash(templateName),
      const DeepCollectionEquality().hash(_user),
      const DeepCollectionEquality().hash(_cartItems));

  @JsonKey(ignore: true)
  @override
  _$$_OrderTemplateDtoCopyWith<_$_OrderTemplateDto> get copyWith =>
      __$$_OrderTemplateDtoCopyWithImpl<_$_OrderTemplateDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderTemplateDtoToJson(
      this,
    );
  }
}

abstract class _OrderTemplateDto extends OrderTemplateDto {
  const factory _OrderTemplateDto(
      {@JsonKey(name: 'id')
          required final String templateId,
      @JsonKey(name: 'name', defaultValue: '')
          required final String templateName,
      @JsonKey(name: 'user', defaultValue: <String, dynamic>{})
          required final Map<String, dynamic> user,
      @_CartItemListConverter()
      @JsonKey(name: 'cartList', defaultValue: <CartItemDto>[])
          required final List<CartItemDto> cartItems}) = _$_OrderTemplateDto;
  const _OrderTemplateDto._() : super._();

  factory _OrderTemplateDto.fromJson(Map<String, dynamic> json) =
      _$_OrderTemplateDto.fromJson;

  @override
  @JsonKey(name: 'id')
  String get templateId;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get templateName;
  @override // TODO: use UserDto someday
  @JsonKey(name: 'user', defaultValue: <String, dynamic>{})
  Map<String, dynamic> get user;
  @override // TODO: by right we no need this
  @_CartItemListConverter()
  @JsonKey(name: 'cartList', defaultValue: <CartItemDto>[])
  List<CartItemDto> get cartItems;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTemplateDtoCopyWith<_$_OrderTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}
