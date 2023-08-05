// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_suggestion_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductSuggestionHistoryDto _$ProductSuggestionHistoryDtoFromJson(
    Map<String, dynamic> json) {
  return _ProductSuggestionHistoryDto.fromJson(json);
}

/// @nodoc
mixin _$ProductSuggestionHistoryDto {
  @JsonKey(name: 'searchKeyList')
  @HiveField(0, defaultValue: <String>[])
  List<String> get searchKeyList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductSuggestionHistoryDtoCopyWith<ProductSuggestionHistoryDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSuggestionHistoryDtoCopyWith<$Res> {
  factory $ProductSuggestionHistoryDtoCopyWith(
          ProductSuggestionHistoryDto value,
          $Res Function(ProductSuggestionHistoryDto) then) =
      _$ProductSuggestionHistoryDtoCopyWithImpl<$Res,
          ProductSuggestionHistoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'searchKeyList')
      @HiveField(0, defaultValue: <String>[])
          List<String> searchKeyList});
}

/// @nodoc
class _$ProductSuggestionHistoryDtoCopyWithImpl<$Res,
        $Val extends ProductSuggestionHistoryDto>
    implements $ProductSuggestionHistoryDtoCopyWith<$Res> {
  _$ProductSuggestionHistoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKeyList = null,
  }) {
    return _then(_value.copyWith(
      searchKeyList: null == searchKeyList
          ? _value.searchKeyList
          : searchKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductSuggestionHistoryDtoCopyWith<$Res>
    implements $ProductSuggestionHistoryDtoCopyWith<$Res> {
  factory _$$_ProductSuggestionHistoryDtoCopyWith(
          _$_ProductSuggestionHistoryDto value,
          $Res Function(_$_ProductSuggestionHistoryDto) then) =
      __$$_ProductSuggestionHistoryDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'searchKeyList')
      @HiveField(0, defaultValue: <String>[])
          List<String> searchKeyList});
}

/// @nodoc
class __$$_ProductSuggestionHistoryDtoCopyWithImpl<$Res>
    extends _$ProductSuggestionHistoryDtoCopyWithImpl<$Res,
        _$_ProductSuggestionHistoryDto>
    implements _$$_ProductSuggestionHistoryDtoCopyWith<$Res> {
  __$$_ProductSuggestionHistoryDtoCopyWithImpl(
      _$_ProductSuggestionHistoryDto _value,
      $Res Function(_$_ProductSuggestionHistoryDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKeyList = null,
  }) {
    return _then(_$_ProductSuggestionHistoryDto(
      searchKeyList: null == searchKeyList
          ? _value._searchKeyList
          : searchKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 38, adapterName: 'ProductSuggestionHistoryDtoAdapter')
class _$_ProductSuggestionHistoryDto extends _ProductSuggestionHistoryDto {
  _$_ProductSuggestionHistoryDto(
      {@JsonKey(name: 'searchKeyList')
      @HiveField(0, defaultValue: <String>[])
          required final List<String> searchKeyList})
      : _searchKeyList = searchKeyList,
        super._();

  factory _$_ProductSuggestionHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProductSuggestionHistoryDtoFromJson(json);

  final List<String> _searchKeyList;
  @override
  @JsonKey(name: 'searchKeyList')
  @HiveField(0, defaultValue: <String>[])
  List<String> get searchKeyList {
    if (_searchKeyList is EqualUnmodifiableListView) return _searchKeyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchKeyList);
  }

  @override
  String toString() {
    return 'ProductSuggestionHistoryDto(searchKeyList: $searchKeyList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductSuggestionHistoryDto &&
            const DeepCollectionEquality()
                .equals(other._searchKeyList, _searchKeyList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchKeyList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductSuggestionHistoryDtoCopyWith<_$_ProductSuggestionHistoryDto>
      get copyWith => __$$_ProductSuggestionHistoryDtoCopyWithImpl<
          _$_ProductSuggestionHistoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductSuggestionHistoryDtoToJson(
      this,
    );
  }
}

abstract class _ProductSuggestionHistoryDto
    extends ProductSuggestionHistoryDto {
  factory _ProductSuggestionHistoryDto(
          {@JsonKey(name: 'searchKeyList')
          @HiveField(0, defaultValue: <String>[])
              required final List<String> searchKeyList}) =
      _$_ProductSuggestionHistoryDto;
  _ProductSuggestionHistoryDto._() : super._();

  factory _ProductSuggestionHistoryDto.fromJson(Map<String, dynamic> json) =
      _$_ProductSuggestionHistoryDto.fromJson;

  @override
  @JsonKey(name: 'searchKeyList')
  @HiveField(0, defaultValue: <String>[])
  List<String> get searchKeyList;
  @override
  @JsonKey(ignore: true)
  _$$_ProductSuggestionHistoryDtoCopyWith<_$_ProductSuggestionHistoryDto>
      get copyWith => throw _privateConstructorUsedError;
}
