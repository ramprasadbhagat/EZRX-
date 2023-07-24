// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnRequestDto _$ReturnRequestDtoFromJson(Map<String, dynamic> json) {
  return _ReturnRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnRequestDto {
  @JsonKey(name: 'isSearchComplete', defaultValue: false)
  bool get isSearchComplete => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'materialBasicInformation',
      defaultValue: <MaterialBasicInformationDto>[])
  List<MaterialBasicInformationDto> get basicInformations =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'materials',
      fromJson: _unmarshallMaterialItem,
      defaultValue: <ReturnItemDto>[])
  List<ReturnItemDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnRequestDtoCopyWith<ReturnRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestDtoCopyWith<$Res> {
  factory $ReturnRequestDtoCopyWith(
          ReturnRequestDto value, $Res Function(ReturnRequestDto) then) =
      _$ReturnRequestDtoCopyWithImpl<$Res, ReturnRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'isSearchComplete', defaultValue: false)
          bool isSearchComplete,
      @JsonKey(
          name: 'materialBasicInformation', defaultValue: <
              MaterialBasicInformationDto>[])
          List<MaterialBasicInformationDto> basicInformations,
      @JsonKey(
          name: 'materials', fromJson: _unmarshallMaterialItem, defaultValue: <
              ReturnItemDto>[])
          List<ReturnItemDto> items});
}

/// @nodoc
class _$ReturnRequestDtoCopyWithImpl<$Res, $Val extends ReturnRequestDto>
    implements $ReturnRequestDtoCopyWith<$Res> {
  _$ReturnRequestDtoCopyWithImpl(this._value, this._then);

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
              as List<MaterialBasicInformationDto>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnRequestDtoCopyWith<$Res>
    implements $ReturnRequestDtoCopyWith<$Res> {
  factory _$$_ReturnRequestDtoCopyWith(
          _$_ReturnRequestDto value, $Res Function(_$_ReturnRequestDto) then) =
      __$$_ReturnRequestDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'isSearchComplete', defaultValue: false)
          bool isSearchComplete,
      @JsonKey(
          name: 'materialBasicInformation', defaultValue: <
              MaterialBasicInformationDto>[])
          List<MaterialBasicInformationDto> basicInformations,
      @JsonKey(
          name: 'materials', fromJson: _unmarshallMaterialItem, defaultValue: <
              ReturnItemDto>[])
          List<ReturnItemDto> items});
}

/// @nodoc
class __$$_ReturnRequestDtoCopyWithImpl<$Res>
    extends _$ReturnRequestDtoCopyWithImpl<$Res, _$_ReturnRequestDto>
    implements _$$_ReturnRequestDtoCopyWith<$Res> {
  __$$_ReturnRequestDtoCopyWithImpl(
      _$_ReturnRequestDto _value, $Res Function(_$_ReturnRequestDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearchComplete = null,
    Object? basicInformations = null,
    Object? items = null,
  }) {
    return _then(_$_ReturnRequestDto(
      isSearchComplete: null == isSearchComplete
          ? _value.isSearchComplete
          : isSearchComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      basicInformations: null == basicInformations
          ? _value._basicInformations
          : basicInformations // ignore: cast_nullable_to_non_nullable
              as List<MaterialBasicInformationDto>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnRequestDto extends _ReturnRequestDto {
  const _$_ReturnRequestDto(
      {@JsonKey(name: 'isSearchComplete', defaultValue: false)
          required this.isSearchComplete,
      @JsonKey(
          name: 'materialBasicInformation', defaultValue: <
              MaterialBasicInformationDto>[])
          required final List<MaterialBasicInformationDto> basicInformations,
      @JsonKey(
          name: 'materials', fromJson: _unmarshallMaterialItem, defaultValue: <
              ReturnItemDto>[])
          required final List<ReturnItemDto> items})
      : _basicInformations = basicInformations,
        _items = items,
        super._();

  factory _$_ReturnRequestDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnRequestDtoFromJson(json);

  @override
  @JsonKey(name: 'isSearchComplete', defaultValue: false)
  final bool isSearchComplete;
  final List<MaterialBasicInformationDto> _basicInformations;
  @override
  @JsonKey(
      name: 'materialBasicInformation',
      defaultValue: <MaterialBasicInformationDto>[])
  List<MaterialBasicInformationDto> get basicInformations {
    if (_basicInformations is EqualUnmodifiableListView)
      return _basicInformations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basicInformations);
  }

  final List<ReturnItemDto> _items;
  @override
  @JsonKey(
      name: 'materials',
      fromJson: _unmarshallMaterialItem,
      defaultValue: <ReturnItemDto>[])
  List<ReturnItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ReturnRequestDto(isSearchComplete: $isSearchComplete, basicInformations: $basicInformations, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnRequestDto &&
            (identical(other.isSearchComplete, isSearchComplete) ||
                other.isSearchComplete == isSearchComplete) &&
            const DeepCollectionEquality()
                .equals(other._basicInformations, _basicInformations) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSearchComplete,
      const DeepCollectionEquality().hash(_basicInformations),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnRequestDtoCopyWith<_$_ReturnRequestDto> get copyWith =>
      __$$_ReturnRequestDtoCopyWithImpl<_$_ReturnRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnRequestDtoToJson(
      this,
    );
  }
}

abstract class _ReturnRequestDto extends ReturnRequestDto {
  const factory _ReturnRequestDto(
      {@JsonKey(name: 'isSearchComplete', defaultValue: false)
          required final bool isSearchComplete,
      @JsonKey(
          name: 'materialBasicInformation', defaultValue: <
              MaterialBasicInformationDto>[])
          required final List<MaterialBasicInformationDto> basicInformations,
      @JsonKey(
          name: 'materials', fromJson: _unmarshallMaterialItem, defaultValue: <
              ReturnItemDto>[])
          required final List<ReturnItemDto> items}) = _$_ReturnRequestDto;
  const _ReturnRequestDto._() : super._();

  factory _ReturnRequestDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnRequestDto.fromJson;

  @override
  @JsonKey(name: 'isSearchComplete', defaultValue: false)
  bool get isSearchComplete;
  @override
  @JsonKey(
      name: 'materialBasicInformation',
      defaultValue: <MaterialBasicInformationDto>[])
  List<MaterialBasicInformationDto> get basicInformations;
  @override
  @JsonKey(
      name: 'materials',
      fromJson: _unmarshallMaterialItem,
      defaultValue: <ReturnItemDto>[])
  List<ReturnItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnRequestDtoCopyWith<_$_ReturnRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}
