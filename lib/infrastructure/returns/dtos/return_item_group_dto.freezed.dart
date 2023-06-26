// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_item_group_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnItemGroupDto _$ReturnItemGroupDtoFromJson(Map<String, dynamic> json) {
  return _ReturnItemGroupDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnItemGroupDto {
  @JsonKey(name: 'requestDate', defaultValue: '')
  String get requestDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestByItems', defaultValue: <ReturnItemDto>[])
  List<ReturnItemDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnItemGroupDtoCopyWith<ReturnItemGroupDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnItemGroupDtoCopyWith<$Res> {
  factory $ReturnItemGroupDtoCopyWith(
          ReturnItemGroupDto value, $Res Function(ReturnItemGroupDto) then) =
      _$ReturnItemGroupDtoCopyWithImpl<$Res, ReturnItemGroupDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestDate', defaultValue: '')
          String requestDate,
      @JsonKey(name: 'requestByItems', defaultValue: <ReturnItemDto>[])
          List<ReturnItemDto> items});
}

/// @nodoc
class _$ReturnItemGroupDtoCopyWithImpl<$Res, $Val extends ReturnItemGroupDto>
    implements $ReturnItemGroupDtoCopyWith<$Res> {
  _$ReturnItemGroupDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestDate = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnItemGroupDtoCopyWith<$Res>
    implements $ReturnItemGroupDtoCopyWith<$Res> {
  factory _$$_ReturnItemGroupDtoCopyWith(_$_ReturnItemGroupDto value,
          $Res Function(_$_ReturnItemGroupDto) then) =
      __$$_ReturnItemGroupDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestDate', defaultValue: '')
          String requestDate,
      @JsonKey(name: 'requestByItems', defaultValue: <ReturnItemDto>[])
          List<ReturnItemDto> items});
}

/// @nodoc
class __$$_ReturnItemGroupDtoCopyWithImpl<$Res>
    extends _$ReturnItemGroupDtoCopyWithImpl<$Res, _$_ReturnItemGroupDto>
    implements _$$_ReturnItemGroupDtoCopyWith<$Res> {
  __$$_ReturnItemGroupDtoCopyWithImpl(
      _$_ReturnItemGroupDto _value, $Res Function(_$_ReturnItemGroupDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestDate = null,
    Object? items = null,
  }) {
    return _then(_$_ReturnItemGroupDto(
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnItemGroupDto extends _ReturnItemGroupDto {
  const _$_ReturnItemGroupDto(
      {@JsonKey(name: 'requestDate', defaultValue: '')
          required this.requestDate,
      @JsonKey(name: 'requestByItems', defaultValue: <ReturnItemDto>[])
          required final List<ReturnItemDto> items})
      : _items = items,
        super._();

  factory _$_ReturnItemGroupDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnItemGroupDtoFromJson(json);

  @override
  @JsonKey(name: 'requestDate', defaultValue: '')
  final String requestDate;
  final List<ReturnItemDto> _items;
  @override
  @JsonKey(name: 'requestByItems', defaultValue: <ReturnItemDto>[])
  List<ReturnItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ReturnItemGroupDto(requestDate: $requestDate, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnItemGroupDto &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, requestDate, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnItemGroupDtoCopyWith<_$_ReturnItemGroupDto> get copyWith =>
      __$$_ReturnItemGroupDtoCopyWithImpl<_$_ReturnItemGroupDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnItemGroupDtoToJson(
      this,
    );
  }
}

abstract class _ReturnItemGroupDto extends ReturnItemGroupDto {
  const factory _ReturnItemGroupDto(
      {@JsonKey(name: 'requestDate', defaultValue: '')
          required final String requestDate,
      @JsonKey(name: 'requestByItems', defaultValue: <ReturnItemDto>[])
          required final List<ReturnItemDto> items}) = _$_ReturnItemGroupDto;
  const _ReturnItemGroupDto._() : super._();

  factory _ReturnItemGroupDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnItemGroupDto.fromJson;

  @override
  @JsonKey(name: 'requestDate', defaultValue: '')
  String get requestDate;
  @override
  @JsonKey(name: 'requestByItems', defaultValue: <ReturnItemDto>[])
  List<ReturnItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnItemGroupDtoCopyWith<_$_ReturnItemGroupDto> get copyWith =>
      throw _privateConstructorUsedError;
}
