// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FaqEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, User user) getFaq,
    required TResult Function(SalesOrg salesOrg, User user) loadMoreAFaq,
    required TResult Function(FAQCategory selectedCategory) filterByFaqCategory,
    required TResult Function(String searchKey) updatedSearchFaq,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, User user)? getFaq,
    TResult? Function(SalesOrg salesOrg, User user)? loadMoreAFaq,
    TResult? Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult? Function(String searchKey)? updatedSearchFaq,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, User user)? getFaq,
    TResult Function(SalesOrg salesOrg, User user)? loadMoreAFaq,
    TResult Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult Function(String searchKey)? updatedSearchFaq,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFaq value) getFaq,
    required TResult Function(_LoadMoreFaq value) loadMoreAFaq,
    required TResult Function(_FilterByFaqCategory value) filterByFaqCategory,
    required TResult Function(_UpdatedSearchFaq value) updatedSearchFaq,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFaq value)? getFaq,
    TResult? Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult? Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult? Function(_UpdatedSearchFaq value)? updatedSearchFaq,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFaq value)? getFaq,
    TResult Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult Function(_UpdatedSearchFaq value)? updatedSearchFaq,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqEventCopyWith<$Res> {
  factory $FaqEventCopyWith(FaqEvent value, $Res Function(FaqEvent) then) =
      _$FaqEventCopyWithImpl<$Res, FaqEvent>;
}

/// @nodoc
class _$FaqEventCopyWithImpl<$Res, $Val extends FaqEvent>
    implements $FaqEventCopyWith<$Res> {
  _$FaqEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetFaqCopyWith<$Res> {
  factory _$$_GetFaqCopyWith(_$_GetFaq value, $Res Function(_$_GetFaq) then) =
      __$$_GetFaqCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_GetFaqCopyWithImpl<$Res>
    extends _$FaqEventCopyWithImpl<$Res, _$_GetFaq>
    implements _$$_GetFaqCopyWith<$Res> {
  __$$_GetFaqCopyWithImpl(_$_GetFaq _value, $Res Function(_$_GetFaq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? user = null,
  }) {
    return _then(_$_GetFaq(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_GetFaq implements _GetFaq {
  const _$_GetFaq({required this.salesOrg, required this.user});

  @override
  final SalesOrg salesOrg;
  @override
  final User user;

  @override
  String toString() {
    return 'FaqEvent.getFaq(salesOrg: $salesOrg, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFaq &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetFaqCopyWith<_$_GetFaq> get copyWith =>
      __$$_GetFaqCopyWithImpl<_$_GetFaq>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, User user) getFaq,
    required TResult Function(SalesOrg salesOrg, User user) loadMoreAFaq,
    required TResult Function(FAQCategory selectedCategory) filterByFaqCategory,
    required TResult Function(String searchKey) updatedSearchFaq,
  }) {
    return getFaq(salesOrg, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, User user)? getFaq,
    TResult? Function(SalesOrg salesOrg, User user)? loadMoreAFaq,
    TResult? Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult? Function(String searchKey)? updatedSearchFaq,
  }) {
    return getFaq?.call(salesOrg, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, User user)? getFaq,
    TResult Function(SalesOrg salesOrg, User user)? loadMoreAFaq,
    TResult Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult Function(String searchKey)? updatedSearchFaq,
    required TResult orElse(),
  }) {
    if (getFaq != null) {
      return getFaq(salesOrg, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFaq value) getFaq,
    required TResult Function(_LoadMoreFaq value) loadMoreAFaq,
    required TResult Function(_FilterByFaqCategory value) filterByFaqCategory,
    required TResult Function(_UpdatedSearchFaq value) updatedSearchFaq,
  }) {
    return getFaq(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFaq value)? getFaq,
    TResult? Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult? Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult? Function(_UpdatedSearchFaq value)? updatedSearchFaq,
  }) {
    return getFaq?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFaq value)? getFaq,
    TResult Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult Function(_UpdatedSearchFaq value)? updatedSearchFaq,
    required TResult orElse(),
  }) {
    if (getFaq != null) {
      return getFaq(this);
    }
    return orElse();
  }
}

abstract class _GetFaq implements FaqEvent {
  const factory _GetFaq(
      {required final SalesOrg salesOrg, required final User user}) = _$_GetFaq;

  SalesOrg get salesOrg;
  User get user;
  @JsonKey(ignore: true)
  _$$_GetFaqCopyWith<_$_GetFaq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreFaqCopyWith<$Res> {
  factory _$$_LoadMoreFaqCopyWith(
          _$_LoadMoreFaq value, $Res Function(_$_LoadMoreFaq) then) =
      __$$_LoadMoreFaqCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_LoadMoreFaqCopyWithImpl<$Res>
    extends _$FaqEventCopyWithImpl<$Res, _$_LoadMoreFaq>
    implements _$$_LoadMoreFaqCopyWith<$Res> {
  __$$_LoadMoreFaqCopyWithImpl(
      _$_LoadMoreFaq _value, $Res Function(_$_LoadMoreFaq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? user = null,
  }) {
    return _then(_$_LoadMoreFaq(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_LoadMoreFaq implements _LoadMoreFaq {
  const _$_LoadMoreFaq({required this.salesOrg, required this.user});

  @override
  final SalesOrg salesOrg;
  @override
  final User user;

  @override
  String toString() {
    return 'FaqEvent.loadMoreAFaq(salesOrg: $salesOrg, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMoreFaq &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMoreFaqCopyWith<_$_LoadMoreFaq> get copyWith =>
      __$$_LoadMoreFaqCopyWithImpl<_$_LoadMoreFaq>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, User user) getFaq,
    required TResult Function(SalesOrg salesOrg, User user) loadMoreAFaq,
    required TResult Function(FAQCategory selectedCategory) filterByFaqCategory,
    required TResult Function(String searchKey) updatedSearchFaq,
  }) {
    return loadMoreAFaq(salesOrg, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, User user)? getFaq,
    TResult? Function(SalesOrg salesOrg, User user)? loadMoreAFaq,
    TResult? Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult? Function(String searchKey)? updatedSearchFaq,
  }) {
    return loadMoreAFaq?.call(salesOrg, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, User user)? getFaq,
    TResult Function(SalesOrg salesOrg, User user)? loadMoreAFaq,
    TResult Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult Function(String searchKey)? updatedSearchFaq,
    required TResult orElse(),
  }) {
    if (loadMoreAFaq != null) {
      return loadMoreAFaq(salesOrg, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFaq value) getFaq,
    required TResult Function(_LoadMoreFaq value) loadMoreAFaq,
    required TResult Function(_FilterByFaqCategory value) filterByFaqCategory,
    required TResult Function(_UpdatedSearchFaq value) updatedSearchFaq,
  }) {
    return loadMoreAFaq(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFaq value)? getFaq,
    TResult? Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult? Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult? Function(_UpdatedSearchFaq value)? updatedSearchFaq,
  }) {
    return loadMoreAFaq?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFaq value)? getFaq,
    TResult Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult Function(_UpdatedSearchFaq value)? updatedSearchFaq,
    required TResult orElse(),
  }) {
    if (loadMoreAFaq != null) {
      return loadMoreAFaq(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreFaq implements FaqEvent {
  const factory _LoadMoreFaq(
      {required final SalesOrg salesOrg,
      required final User user}) = _$_LoadMoreFaq;

  SalesOrg get salesOrg;
  User get user;
  @JsonKey(ignore: true)
  _$$_LoadMoreFaqCopyWith<_$_LoadMoreFaq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FilterByFaqCategoryCopyWith<$Res> {
  factory _$$_FilterByFaqCategoryCopyWith(_$_FilterByFaqCategory value,
          $Res Function(_$_FilterByFaqCategory) then) =
      __$$_FilterByFaqCategoryCopyWithImpl<$Res>;
  @useResult
  $Res call({FAQCategory selectedCategory});
}

/// @nodoc
class __$$_FilterByFaqCategoryCopyWithImpl<$Res>
    extends _$FaqEventCopyWithImpl<$Res, _$_FilterByFaqCategory>
    implements _$$_FilterByFaqCategoryCopyWith<$Res> {
  __$$_FilterByFaqCategoryCopyWithImpl(_$_FilterByFaqCategory _value,
      $Res Function(_$_FilterByFaqCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = null,
  }) {
    return _then(_$_FilterByFaqCategory(
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as FAQCategory,
    ));
  }
}

/// @nodoc

class _$_FilterByFaqCategory implements _FilterByFaqCategory {
  const _$_FilterByFaqCategory({required this.selectedCategory});

  @override
  final FAQCategory selectedCategory;

  @override
  String toString() {
    return 'FaqEvent.filterByFaqCategory(selectedCategory: $selectedCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterByFaqCategory &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterByFaqCategoryCopyWith<_$_FilterByFaqCategory> get copyWith =>
      __$$_FilterByFaqCategoryCopyWithImpl<_$_FilterByFaqCategory>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, User user) getFaq,
    required TResult Function(SalesOrg salesOrg, User user) loadMoreAFaq,
    required TResult Function(FAQCategory selectedCategory) filterByFaqCategory,
    required TResult Function(String searchKey) updatedSearchFaq,
  }) {
    return filterByFaqCategory(selectedCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, User user)? getFaq,
    TResult? Function(SalesOrg salesOrg, User user)? loadMoreAFaq,
    TResult? Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult? Function(String searchKey)? updatedSearchFaq,
  }) {
    return filterByFaqCategory?.call(selectedCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, User user)? getFaq,
    TResult Function(SalesOrg salesOrg, User user)? loadMoreAFaq,
    TResult Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult Function(String searchKey)? updatedSearchFaq,
    required TResult orElse(),
  }) {
    if (filterByFaqCategory != null) {
      return filterByFaqCategory(selectedCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFaq value) getFaq,
    required TResult Function(_LoadMoreFaq value) loadMoreAFaq,
    required TResult Function(_FilterByFaqCategory value) filterByFaqCategory,
    required TResult Function(_UpdatedSearchFaq value) updatedSearchFaq,
  }) {
    return filterByFaqCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFaq value)? getFaq,
    TResult? Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult? Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult? Function(_UpdatedSearchFaq value)? updatedSearchFaq,
  }) {
    return filterByFaqCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFaq value)? getFaq,
    TResult Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult Function(_UpdatedSearchFaq value)? updatedSearchFaq,
    required TResult orElse(),
  }) {
    if (filterByFaqCategory != null) {
      return filterByFaqCategory(this);
    }
    return orElse();
  }
}

abstract class _FilterByFaqCategory implements FaqEvent {
  const factory _FilterByFaqCategory(
      {required final FAQCategory selectedCategory}) = _$_FilterByFaqCategory;

  FAQCategory get selectedCategory;
  @JsonKey(ignore: true)
  _$$_FilterByFaqCategoryCopyWith<_$_FilterByFaqCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatedSearchFaqCopyWith<$Res> {
  factory _$$_UpdatedSearchFaqCopyWith(
          _$_UpdatedSearchFaq value, $Res Function(_$_UpdatedSearchFaq) then) =
      __$$_UpdatedSearchFaqCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchKey});
}

/// @nodoc
class __$$_UpdatedSearchFaqCopyWithImpl<$Res>
    extends _$FaqEventCopyWithImpl<$Res, _$_UpdatedSearchFaq>
    implements _$$_UpdatedSearchFaqCopyWith<$Res> {
  __$$_UpdatedSearchFaqCopyWithImpl(
      _$_UpdatedSearchFaq _value, $Res Function(_$_UpdatedSearchFaq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$_UpdatedSearchFaq(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdatedSearchFaq implements _UpdatedSearchFaq {
  const _$_UpdatedSearchFaq({required this.searchKey});

  @override
  final String searchKey;

  @override
  String toString() {
    return 'FaqEvent.updatedSearchFaq(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatedSearchFaq &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatedSearchFaqCopyWith<_$_UpdatedSearchFaq> get copyWith =>
      __$$_UpdatedSearchFaqCopyWithImpl<_$_UpdatedSearchFaq>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, User user) getFaq,
    required TResult Function(SalesOrg salesOrg, User user) loadMoreAFaq,
    required TResult Function(FAQCategory selectedCategory) filterByFaqCategory,
    required TResult Function(String searchKey) updatedSearchFaq,
  }) {
    return updatedSearchFaq(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, User user)? getFaq,
    TResult? Function(SalesOrg salesOrg, User user)? loadMoreAFaq,
    TResult? Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult? Function(String searchKey)? updatedSearchFaq,
  }) {
    return updatedSearchFaq?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, User user)? getFaq,
    TResult Function(SalesOrg salesOrg, User user)? loadMoreAFaq,
    TResult Function(FAQCategory selectedCategory)? filterByFaqCategory,
    TResult Function(String searchKey)? updatedSearchFaq,
    required TResult orElse(),
  }) {
    if (updatedSearchFaq != null) {
      return updatedSearchFaq(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFaq value) getFaq,
    required TResult Function(_LoadMoreFaq value) loadMoreAFaq,
    required TResult Function(_FilterByFaqCategory value) filterByFaqCategory,
    required TResult Function(_UpdatedSearchFaq value) updatedSearchFaq,
  }) {
    return updatedSearchFaq(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetFaq value)? getFaq,
    TResult? Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult? Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult? Function(_UpdatedSearchFaq value)? updatedSearchFaq,
  }) {
    return updatedSearchFaq?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFaq value)? getFaq,
    TResult Function(_LoadMoreFaq value)? loadMoreAFaq,
    TResult Function(_FilterByFaqCategory value)? filterByFaqCategory,
    TResult Function(_UpdatedSearchFaq value)? updatedSearchFaq,
    required TResult orElse(),
  }) {
    if (updatedSearchFaq != null) {
      return updatedSearchFaq(this);
    }
    return orElse();
  }
}

abstract class _UpdatedSearchFaq implements FaqEvent {
  const factory _UpdatedSearchFaq({required final String searchKey}) =
      _$_UpdatedSearchFaq;

  String get searchKey;
  @JsonKey(ignore: true)
  _$$_UpdatedSearchFaqCopyWith<_$_UpdatedSearchFaq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FaqState {
  FAQInfo get faqInfo => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  FAQCategory get selectedCategory => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaqStateCopyWith<FaqState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqStateCopyWith<$Res> {
  factory $FaqStateCopyWith(FaqState value, $Res Function(FaqState) then) =
      _$FaqStateCopyWithImpl<$Res, FaqState>;
  @useResult
  $Res call(
      {FAQInfo faqInfo,
      bool isFetching,
      bool canLoadMore,
      FAQCategory selectedCategory,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $FAQInfoCopyWith<$Res> get faqInfo;
}

/// @nodoc
class _$FaqStateCopyWithImpl<$Res, $Val extends FaqState>
    implements $FaqStateCopyWith<$Res> {
  _$FaqStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faqInfo = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? selectedCategory = null,
    Object? searchKey = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      faqInfo: null == faqInfo
          ? _value.faqInfo
          : faqInfo // ignore: cast_nullable_to_non_nullable
              as FAQInfo,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as FAQCategory,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FAQInfoCopyWith<$Res> get faqInfo {
    return $FAQInfoCopyWith<$Res>(_value.faqInfo, (value) {
      return _then(_value.copyWith(faqInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FaqStateCopyWith<$Res> implements $FaqStateCopyWith<$Res> {
  factory _$$_FaqStateCopyWith(
          _$_FaqState value, $Res Function(_$_FaqState) then) =
      __$$_FaqStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FAQInfo faqInfo,
      bool isFetching,
      bool canLoadMore,
      FAQCategory selectedCategory,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $FAQInfoCopyWith<$Res> get faqInfo;
}

/// @nodoc
class __$$_FaqStateCopyWithImpl<$Res>
    extends _$FaqStateCopyWithImpl<$Res, _$_FaqState>
    implements _$$_FaqStateCopyWith<$Res> {
  __$$_FaqStateCopyWithImpl(
      _$_FaqState _value, $Res Function(_$_FaqState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faqInfo = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? selectedCategory = null,
    Object? searchKey = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$_FaqState(
      faqInfo: null == faqInfo
          ? _value.faqInfo
          : faqInfo // ignore: cast_nullable_to_non_nullable
              as FAQInfo,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as FAQCategory,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_FaqState extends _FaqState {
  const _$_FaqState(
      {required this.faqInfo,
      required this.isFetching,
      required this.canLoadMore,
      required this.selectedCategory,
      required this.searchKey,
      required this.apiFailureOrSuccessOption})
      : super._();

  @override
  final FAQInfo faqInfo;
  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final FAQCategory selectedCategory;
  @override
  final SearchKey searchKey;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'FaqState(faqInfo: $faqInfo, isFetching: $isFetching, canLoadMore: $canLoadMore, selectedCategory: $selectedCategory, searchKey: $searchKey, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FaqState &&
            (identical(other.faqInfo, faqInfo) || other.faqInfo == faqInfo) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, faqInfo, isFetching, canLoadMore,
      selectedCategory, searchKey, apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FaqStateCopyWith<_$_FaqState> get copyWith =>
      __$$_FaqStateCopyWithImpl<_$_FaqState>(this, _$identity);
}

abstract class _FaqState extends FaqState {
  const factory _FaqState(
      {required final FAQInfo faqInfo,
      required final bool isFetching,
      required final bool canLoadMore,
      required final FAQCategory selectedCategory,
      required final SearchKey searchKey,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_FaqState;
  const _FaqState._() : super._();

  @override
  FAQInfo get faqInfo;
  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  FAQCategory get selectedCategory;
  @override
  SearchKey get searchKey;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_FaqStateCopyWith<_$_FaqState> get copyWith =>
      throw _privateConstructorUsedError;
}
