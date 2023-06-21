// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_suggestion_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductSuggestionHistory {
  List<SearchKey> get searchKeyList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductSuggestionHistoryCopyWith<ProductSuggestionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSuggestionHistoryCopyWith<$Res> {
  factory $ProductSuggestionHistoryCopyWith(ProductSuggestionHistory value,
          $Res Function(ProductSuggestionHistory) then) =
      _$ProductSuggestionHistoryCopyWithImpl<$Res, ProductSuggestionHistory>;
  @useResult
  $Res call({List<SearchKey> searchKeyList});
}

/// @nodoc
class _$ProductSuggestionHistoryCopyWithImpl<$Res,
        $Val extends ProductSuggestionHistory>
    implements $ProductSuggestionHistoryCopyWith<$Res> {
  _$ProductSuggestionHistoryCopyWithImpl(this._value, this._then);

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
              as List<SearchKey>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductSuggestionHistoryCopyWith<$Res>
    implements $ProductSuggestionHistoryCopyWith<$Res> {
  factory _$$_ProductSuggestionHistoryCopyWith(
          _$_ProductSuggestionHistory value,
          $Res Function(_$_ProductSuggestionHistory) then) =
      __$$_ProductSuggestionHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchKey> searchKeyList});
}

/// @nodoc
class __$$_ProductSuggestionHistoryCopyWithImpl<$Res>
    extends _$ProductSuggestionHistoryCopyWithImpl<$Res,
        _$_ProductSuggestionHistory>
    implements _$$_ProductSuggestionHistoryCopyWith<$Res> {
  __$$_ProductSuggestionHistoryCopyWithImpl(_$_ProductSuggestionHistory _value,
      $Res Function(_$_ProductSuggestionHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKeyList = null,
  }) {
    return _then(_$_ProductSuggestionHistory(
      searchKeyList: null == searchKeyList
          ? _value._searchKeyList
          : searchKeyList // ignore: cast_nullable_to_non_nullable
              as List<SearchKey>,
    ));
  }
}

/// @nodoc

class _$_ProductSuggestionHistory extends _ProductSuggestionHistory {
  _$_ProductSuggestionHistory({required final List<SearchKey> searchKeyList})
      : _searchKeyList = searchKeyList,
        super._();

  final List<SearchKey> _searchKeyList;
  @override
  List<SearchKey> get searchKeyList {
    if (_searchKeyList is EqualUnmodifiableListView) return _searchKeyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchKeyList);
  }

  @override
  String toString() {
    return 'ProductSuggestionHistory(searchKeyList: $searchKeyList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductSuggestionHistory &&
            const DeepCollectionEquality()
                .equals(other._searchKeyList, _searchKeyList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchKeyList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductSuggestionHistoryCopyWith<_$_ProductSuggestionHistory>
      get copyWith => __$$_ProductSuggestionHistoryCopyWithImpl<
          _$_ProductSuggestionHistory>(this, _$identity);
}

abstract class _ProductSuggestionHistory extends ProductSuggestionHistory {
  factory _ProductSuggestionHistory(
          {required final List<SearchKey> searchKeyList}) =
      _$_ProductSuggestionHistory;
  _ProductSuggestionHistory._() : super._();

  @override
  List<SearchKey> get searchKeyList;
  @override
  @JsonKey(ignore: true)
  _$$_ProductSuggestionHistoryCopyWith<_$_ProductSuggestionHistory>
      get copyWith => throw _privateConstructorUsedError;
}
