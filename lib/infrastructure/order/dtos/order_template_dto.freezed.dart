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
  String get templateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserDto get user => throw _privateConstructorUsedError;
  @_CartItemListConverter()
  @JsonKey(name: 'cartList', defaultValue: <MaterialItemDto>[])
  List<MaterialItemDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTemplateDtoCopyWith<OrderTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTemplateDtoCopyWith<$Res> {
  factory $OrderTemplateDtoCopyWith(
          OrderTemplateDto value, $Res Function(OrderTemplateDto) then) =
      _$OrderTemplateDtoCopyWithImpl<$Res, OrderTemplateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String templateId,
      @JsonKey(name: 'name', defaultValue: '')
          String templateName,
      @JsonKey(name: 'user')
          UserDto user,
      @_CartItemListConverter()
      @JsonKey(name: 'cartList', defaultValue: <MaterialItemDto>[])
          List<MaterialItemDto> items});

  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$OrderTemplateDtoCopyWithImpl<$Res, $Val extends OrderTemplateDto>
    implements $OrderTemplateDtoCopyWith<$Res> {
  _$OrderTemplateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? templateName = null,
    Object? user = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      templateName: null == templateName
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get user {
    return $UserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderTemplateDtoCopyWith<$Res>
    implements $OrderTemplateDtoCopyWith<$Res> {
  factory _$$_OrderTemplateDtoCopyWith(
          _$_OrderTemplateDto value, $Res Function(_$_OrderTemplateDto) then) =
      __$$_OrderTemplateDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String templateId,
      @JsonKey(name: 'name', defaultValue: '')
          String templateName,
      @JsonKey(name: 'user')
          UserDto user,
      @_CartItemListConverter()
      @JsonKey(name: 'cartList', defaultValue: <MaterialItemDto>[])
          List<MaterialItemDto> items});

  @override
  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$_OrderTemplateDtoCopyWithImpl<$Res>
    extends _$OrderTemplateDtoCopyWithImpl<$Res, _$_OrderTemplateDto>
    implements _$$_OrderTemplateDtoCopyWith<$Res> {
  __$$_OrderTemplateDtoCopyWithImpl(
      _$_OrderTemplateDto _value, $Res Function(_$_OrderTemplateDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? templateName = null,
    Object? user = null,
    Object? items = null,
  }) {
    return _then(_$_OrderTemplateDto(
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      templateName: null == templateName
          ? _value.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemDto>,
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
      @JsonKey(name: 'user')
          this.user = UserDto.emptyUserDto,
      @_CartItemListConverter()
      @JsonKey(name: 'cartList', defaultValue: <MaterialItemDto>[])
          required final List<MaterialItemDto> items})
      : _items = items,
        super._();

  factory _$_OrderTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$$_OrderTemplateDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String templateId;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String templateName;
  @override
  @JsonKey(name: 'user')
  final UserDto user;
  final List<MaterialItemDto> _items;
  @override
  @_CartItemListConverter()
  @JsonKey(name: 'cartList', defaultValue: <MaterialItemDto>[])
  List<MaterialItemDto> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'OrderTemplateDto(templateId: $templateId, templateName: $templateName, user: $user, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTemplateDto &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, templateId, templateName, user,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      @JsonKey(name: 'user')
          final UserDto user,
      @_CartItemListConverter()
      @JsonKey(name: 'cartList', defaultValue: <MaterialItemDto>[])
          required final List<MaterialItemDto> items}) = _$_OrderTemplateDto;
  const _OrderTemplateDto._() : super._();

  factory _OrderTemplateDto.fromJson(Map<String, dynamic> json) =
      _$_OrderTemplateDto.fromJson;

  @override
  @JsonKey(name: 'id')
  String get templateId;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get templateName;
  @override
  @JsonKey(name: 'user')
  UserDto get user;
  @override
  @_CartItemListConverter()
  @JsonKey(name: 'cartList', defaultValue: <MaterialItemDto>[])
  List<MaterialItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTemplateDtoCopyWith<_$_OrderTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}
