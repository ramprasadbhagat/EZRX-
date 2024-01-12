// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_info_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticlesInfoFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filterCategory, bool selected)
        categoryChanged,
    required TResult Function(List<String> filterCategory)
        setCategoryWhileOpenBottomSheet,
    required TResult Function() resetCategory,
    required TResult Function(SalesOrg salesOrg) fetchCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filterCategory, bool selected)? categoryChanged,
    TResult? Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function()? resetCategory,
    TResult? Function(SalesOrg salesOrg)? fetchCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filterCategory, bool selected)? categoryChanged,
    TResult Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult Function()? resetCategory,
    TResult Function(SalesOrg salesOrg)? fetchCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_SetCategoryWhileOpenBottomSheet value)
        setCategoryWhileOpenBottomSheet,
    required TResult Function(_ResetCategory value) resetCategory,
    required TResult Function(_FetchCategory value) fetchCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function(_ResetCategory value)? resetCategory,
    TResult? Function(_FetchCategory value)? fetchCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult Function(_ResetCategory value)? resetCategory,
    TResult Function(_FetchCategory value)? fetchCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesInfoFilterEventCopyWith<$Res> {
  factory $ArticlesInfoFilterEventCopyWith(ArticlesInfoFilterEvent value,
          $Res Function(ArticlesInfoFilterEvent) then) =
      _$ArticlesInfoFilterEventCopyWithImpl<$Res, ArticlesInfoFilterEvent>;
}

/// @nodoc
class _$ArticlesInfoFilterEventCopyWithImpl<$Res,
        $Val extends ArticlesInfoFilterEvent>
    implements $ArticlesInfoFilterEventCopyWith<$Res> {
  _$ArticlesInfoFilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CategoryChangedCopyWith<$Res> {
  factory _$$_CategoryChangedCopyWith(
          _$_CategoryChanged value, $Res Function(_$_CategoryChanged) then) =
      __$$_CategoryChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String filterCategory, bool selected});
}

/// @nodoc
class __$$_CategoryChangedCopyWithImpl<$Res>
    extends _$ArticlesInfoFilterEventCopyWithImpl<$Res, _$_CategoryChanged>
    implements _$$_CategoryChangedCopyWith<$Res> {
  __$$_CategoryChangedCopyWithImpl(
      _$_CategoryChanged _value, $Res Function(_$_CategoryChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterCategory = null,
    Object? selected = null,
  }) {
    return _then(_$_CategoryChanged(
      null == filterCategory
          ? _value.filterCategory
          : filterCategory // ignore: cast_nullable_to_non_nullable
              as String,
      null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CategoryChanged implements _CategoryChanged {
  const _$_CategoryChanged(this.filterCategory, this.selected);

  @override
  final String filterCategory;
  @override
  final bool selected;

  @override
  String toString() {
    return 'ArticlesInfoFilterEvent.categoryChanged(filterCategory: $filterCategory, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryChanged &&
            (identical(other.filterCategory, filterCategory) ||
                other.filterCategory == filterCategory) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterCategory, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryChangedCopyWith<_$_CategoryChanged> get copyWith =>
      __$$_CategoryChangedCopyWithImpl<_$_CategoryChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filterCategory, bool selected)
        categoryChanged,
    required TResult Function(List<String> filterCategory)
        setCategoryWhileOpenBottomSheet,
    required TResult Function() resetCategory,
    required TResult Function(SalesOrg salesOrg) fetchCategory,
  }) {
    return categoryChanged(filterCategory, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filterCategory, bool selected)? categoryChanged,
    TResult? Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function()? resetCategory,
    TResult? Function(SalesOrg salesOrg)? fetchCategory,
  }) {
    return categoryChanged?.call(filterCategory, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filterCategory, bool selected)? categoryChanged,
    TResult Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult Function()? resetCategory,
    TResult Function(SalesOrg salesOrg)? fetchCategory,
    required TResult orElse(),
  }) {
    if (categoryChanged != null) {
      return categoryChanged(filterCategory, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_SetCategoryWhileOpenBottomSheet value)
        setCategoryWhileOpenBottomSheet,
    required TResult Function(_ResetCategory value) resetCategory,
    required TResult Function(_FetchCategory value) fetchCategory,
  }) {
    return categoryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function(_ResetCategory value)? resetCategory,
    TResult? Function(_FetchCategory value)? fetchCategory,
  }) {
    return categoryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult Function(_ResetCategory value)? resetCategory,
    TResult Function(_FetchCategory value)? fetchCategory,
    required TResult orElse(),
  }) {
    if (categoryChanged != null) {
      return categoryChanged(this);
    }
    return orElse();
  }
}

abstract class _CategoryChanged implements ArticlesInfoFilterEvent {
  const factory _CategoryChanged(
      final String filterCategory, final bool selected) = _$_CategoryChanged;

  String get filterCategory;
  bool get selected;
  @JsonKey(ignore: true)
  _$$_CategoryChangedCopyWith<_$_CategoryChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetCategoryWhileOpenBottomSheetCopyWith<$Res> {
  factory _$$_SetCategoryWhileOpenBottomSheetCopyWith(
          _$_SetCategoryWhileOpenBottomSheet value,
          $Res Function(_$_SetCategoryWhileOpenBottomSheet) then) =
      __$$_SetCategoryWhileOpenBottomSheetCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> filterCategory});
}

/// @nodoc
class __$$_SetCategoryWhileOpenBottomSheetCopyWithImpl<$Res>
    extends _$ArticlesInfoFilterEventCopyWithImpl<$Res,
        _$_SetCategoryWhileOpenBottomSheet>
    implements _$$_SetCategoryWhileOpenBottomSheetCopyWith<$Res> {
  __$$_SetCategoryWhileOpenBottomSheetCopyWithImpl(
      _$_SetCategoryWhileOpenBottomSheet _value,
      $Res Function(_$_SetCategoryWhileOpenBottomSheet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterCategory = null,
  }) {
    return _then(_$_SetCategoryWhileOpenBottomSheet(
      null == filterCategory
          ? _value._filterCategory
          : filterCategory // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SetCategoryWhileOpenBottomSheet
    implements _SetCategoryWhileOpenBottomSheet {
  const _$_SetCategoryWhileOpenBottomSheet(final List<String> filterCategory)
      : _filterCategory = filterCategory;

  final List<String> _filterCategory;
  @override
  List<String> get filterCategory {
    if (_filterCategory is EqualUnmodifiableListView) return _filterCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterCategory);
  }

  @override
  String toString() {
    return 'ArticlesInfoFilterEvent.setCategoryWhileOpenBottomSheet(filterCategory: $filterCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetCategoryWhileOpenBottomSheet &&
            const DeepCollectionEquality()
                .equals(other._filterCategory, _filterCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_filterCategory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetCategoryWhileOpenBottomSheetCopyWith<
          _$_SetCategoryWhileOpenBottomSheet>
      get copyWith => __$$_SetCategoryWhileOpenBottomSheetCopyWithImpl<
          _$_SetCategoryWhileOpenBottomSheet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filterCategory, bool selected)
        categoryChanged,
    required TResult Function(List<String> filterCategory)
        setCategoryWhileOpenBottomSheet,
    required TResult Function() resetCategory,
    required TResult Function(SalesOrg salesOrg) fetchCategory,
  }) {
    return setCategoryWhileOpenBottomSheet(filterCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filterCategory, bool selected)? categoryChanged,
    TResult? Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function()? resetCategory,
    TResult? Function(SalesOrg salesOrg)? fetchCategory,
  }) {
    return setCategoryWhileOpenBottomSheet?.call(filterCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filterCategory, bool selected)? categoryChanged,
    TResult Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult Function()? resetCategory,
    TResult Function(SalesOrg salesOrg)? fetchCategory,
    required TResult orElse(),
  }) {
    if (setCategoryWhileOpenBottomSheet != null) {
      return setCategoryWhileOpenBottomSheet(filterCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_SetCategoryWhileOpenBottomSheet value)
        setCategoryWhileOpenBottomSheet,
    required TResult Function(_ResetCategory value) resetCategory,
    required TResult Function(_FetchCategory value) fetchCategory,
  }) {
    return setCategoryWhileOpenBottomSheet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function(_ResetCategory value)? resetCategory,
    TResult? Function(_FetchCategory value)? fetchCategory,
  }) {
    return setCategoryWhileOpenBottomSheet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult Function(_ResetCategory value)? resetCategory,
    TResult Function(_FetchCategory value)? fetchCategory,
    required TResult orElse(),
  }) {
    if (setCategoryWhileOpenBottomSheet != null) {
      return setCategoryWhileOpenBottomSheet(this);
    }
    return orElse();
  }
}

abstract class _SetCategoryWhileOpenBottomSheet
    implements ArticlesInfoFilterEvent {
  const factory _SetCategoryWhileOpenBottomSheet(
      final List<String> filterCategory) = _$_SetCategoryWhileOpenBottomSheet;

  List<String> get filterCategory;
  @JsonKey(ignore: true)
  _$$_SetCategoryWhileOpenBottomSheetCopyWith<
          _$_SetCategoryWhileOpenBottomSheet>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetCategoryCopyWith<$Res> {
  factory _$$_ResetCategoryCopyWith(
          _$_ResetCategory value, $Res Function(_$_ResetCategory) then) =
      __$$_ResetCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetCategoryCopyWithImpl<$Res>
    extends _$ArticlesInfoFilterEventCopyWithImpl<$Res, _$_ResetCategory>
    implements _$$_ResetCategoryCopyWith<$Res> {
  __$$_ResetCategoryCopyWithImpl(
      _$_ResetCategory _value, $Res Function(_$_ResetCategory) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResetCategory implements _ResetCategory {
  const _$_ResetCategory();

  @override
  String toString() {
    return 'ArticlesInfoFilterEvent.resetCategory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResetCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filterCategory, bool selected)
        categoryChanged,
    required TResult Function(List<String> filterCategory)
        setCategoryWhileOpenBottomSheet,
    required TResult Function() resetCategory,
    required TResult Function(SalesOrg salesOrg) fetchCategory,
  }) {
    return resetCategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filterCategory, bool selected)? categoryChanged,
    TResult? Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function()? resetCategory,
    TResult? Function(SalesOrg salesOrg)? fetchCategory,
  }) {
    return resetCategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filterCategory, bool selected)? categoryChanged,
    TResult Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult Function()? resetCategory,
    TResult Function(SalesOrg salesOrg)? fetchCategory,
    required TResult orElse(),
  }) {
    if (resetCategory != null) {
      return resetCategory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_SetCategoryWhileOpenBottomSheet value)
        setCategoryWhileOpenBottomSheet,
    required TResult Function(_ResetCategory value) resetCategory,
    required TResult Function(_FetchCategory value) fetchCategory,
  }) {
    return resetCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function(_ResetCategory value)? resetCategory,
    TResult? Function(_FetchCategory value)? fetchCategory,
  }) {
    return resetCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult Function(_ResetCategory value)? resetCategory,
    TResult Function(_FetchCategory value)? fetchCategory,
    required TResult orElse(),
  }) {
    if (resetCategory != null) {
      return resetCategory(this);
    }
    return orElse();
  }
}

abstract class _ResetCategory implements ArticlesInfoFilterEvent {
  const factory _ResetCategory() = _$_ResetCategory;
}

/// @nodoc
abstract class _$$_FetchCategoryCopyWith<$Res> {
  factory _$$_FetchCategoryCopyWith(
          _$_FetchCategory value, $Res Function(_$_FetchCategory) then) =
      __$$_FetchCategoryCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$_FetchCategoryCopyWithImpl<$Res>
    extends _$ArticlesInfoFilterEventCopyWithImpl<$Res, _$_FetchCategory>
    implements _$$_FetchCategoryCopyWith<$Res> {
  __$$_FetchCategoryCopyWithImpl(
      _$_FetchCategory _value, $Res Function(_$_FetchCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$_FetchCategory(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_FetchCategory implements _FetchCategory {
  const _$_FetchCategory({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'ArticlesInfoFilterEvent.fetchCategory(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchCategory &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCategoryCopyWith<_$_FetchCategory> get copyWith =>
      __$$_FetchCategoryCopyWithImpl<_$_FetchCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filterCategory, bool selected)
        categoryChanged,
    required TResult Function(List<String> filterCategory)
        setCategoryWhileOpenBottomSheet,
    required TResult Function() resetCategory,
    required TResult Function(SalesOrg salesOrg) fetchCategory,
  }) {
    return fetchCategory(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String filterCategory, bool selected)? categoryChanged,
    TResult? Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function()? resetCategory,
    TResult? Function(SalesOrg salesOrg)? fetchCategory,
  }) {
    return fetchCategory?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filterCategory, bool selected)? categoryChanged,
    TResult Function(List<String> filterCategory)?
        setCategoryWhileOpenBottomSheet,
    TResult Function()? resetCategory,
    TResult Function(SalesOrg salesOrg)? fetchCategory,
    required TResult orElse(),
  }) {
    if (fetchCategory != null) {
      return fetchCategory(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_SetCategoryWhileOpenBottomSheet value)
        setCategoryWhileOpenBottomSheet,
    required TResult Function(_ResetCategory value) resetCategory,
    required TResult Function(_FetchCategory value) fetchCategory,
  }) {
    return fetchCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult? Function(_ResetCategory value)? resetCategory,
    TResult? Function(_FetchCategory value)? fetchCategory,
  }) {
    return fetchCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_SetCategoryWhileOpenBottomSheet value)?
        setCategoryWhileOpenBottomSheet,
    TResult Function(_ResetCategory value)? resetCategory,
    TResult Function(_FetchCategory value)? fetchCategory,
    required TResult orElse(),
  }) {
    if (fetchCategory != null) {
      return fetchCategory(this);
    }
    return orElse();
  }
}

abstract class _FetchCategory implements ArticlesInfoFilterEvent {
  const factory _FetchCategory({required final SalesOrg salesOrg}) =
      _$_FetchCategory;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$_FetchCategoryCopyWith<_$_FetchCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArticlesInfoFilterState {
  List<String> get filterCategoryKeyList => throw _privateConstructorUsedError;
  List<String> get categoryKeyList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticlesInfoFilterStateCopyWith<ArticlesInfoFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesInfoFilterStateCopyWith<$Res> {
  factory $ArticlesInfoFilterStateCopyWith(ArticlesInfoFilterState value,
          $Res Function(ArticlesInfoFilterState) then) =
      _$ArticlesInfoFilterStateCopyWithImpl<$Res, ArticlesInfoFilterState>;
  @useResult
  $Res call(
      {List<String> filterCategoryKeyList,
      List<String> categoryKeyList,
      bool isLoading});
}

/// @nodoc
class _$ArticlesInfoFilterStateCopyWithImpl<$Res,
        $Val extends ArticlesInfoFilterState>
    implements $ArticlesInfoFilterStateCopyWith<$Res> {
  _$ArticlesInfoFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterCategoryKeyList = null,
    Object? categoryKeyList = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      filterCategoryKeyList: null == filterCategoryKeyList
          ? _value.filterCategoryKeyList
          : filterCategoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryKeyList: null == categoryKeyList
          ? _value.categoryKeyList
          : categoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticlesInfoFilterStateCopyWith<$Res>
    implements $ArticlesInfoFilterStateCopyWith<$Res> {
  factory _$$_ArticlesInfoFilterStateCopyWith(_$_ArticlesInfoFilterState value,
          $Res Function(_$_ArticlesInfoFilterState) then) =
      __$$_ArticlesInfoFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> filterCategoryKeyList,
      List<String> categoryKeyList,
      bool isLoading});
}

/// @nodoc
class __$$_ArticlesInfoFilterStateCopyWithImpl<$Res>
    extends _$ArticlesInfoFilterStateCopyWithImpl<$Res,
        _$_ArticlesInfoFilterState>
    implements _$$_ArticlesInfoFilterStateCopyWith<$Res> {
  __$$_ArticlesInfoFilterStateCopyWithImpl(_$_ArticlesInfoFilterState _value,
      $Res Function(_$_ArticlesInfoFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterCategoryKeyList = null,
    Object? categoryKeyList = null,
    Object? isLoading = null,
  }) {
    return _then(_$_ArticlesInfoFilterState(
      filterCategoryKeyList: null == filterCategoryKeyList
          ? _value._filterCategoryKeyList
          : filterCategoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryKeyList: null == categoryKeyList
          ? _value._categoryKeyList
          : categoryKeyList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ArticlesInfoFilterState extends _ArticlesInfoFilterState {
  const _$_ArticlesInfoFilterState(
      {required final List<String> filterCategoryKeyList,
      required final List<String> categoryKeyList,
      required this.isLoading})
      : _filterCategoryKeyList = filterCategoryKeyList,
        _categoryKeyList = categoryKeyList,
        super._();

  final List<String> _filterCategoryKeyList;
  @override
  List<String> get filterCategoryKeyList {
    if (_filterCategoryKeyList is EqualUnmodifiableListView)
      return _filterCategoryKeyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterCategoryKeyList);
  }

  final List<String> _categoryKeyList;
  @override
  List<String> get categoryKeyList {
    if (_categoryKeyList is EqualUnmodifiableListView) return _categoryKeyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryKeyList);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ArticlesInfoFilterState(filterCategoryKeyList: $filterCategoryKeyList, categoryKeyList: $categoryKeyList, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticlesInfoFilterState &&
            const DeepCollectionEquality()
                .equals(other._filterCategoryKeyList, _filterCategoryKeyList) &&
            const DeepCollectionEquality()
                .equals(other._categoryKeyList, _categoryKeyList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_filterCategoryKeyList),
      const DeepCollectionEquality().hash(_categoryKeyList),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticlesInfoFilterStateCopyWith<_$_ArticlesInfoFilterState>
      get copyWith =>
          __$$_ArticlesInfoFilterStateCopyWithImpl<_$_ArticlesInfoFilterState>(
              this, _$identity);
}

abstract class _ArticlesInfoFilterState extends ArticlesInfoFilterState {
  const factory _ArticlesInfoFilterState(
      {required final List<String> filterCategoryKeyList,
      required final List<String> categoryKeyList,
      required final bool isLoading}) = _$_ArticlesInfoFilterState;
  const _ArticlesInfoFilterState._() : super._();

  @override
  List<String> get filterCategoryKeyList;
  @override
  List<String> get categoryKeyList;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ArticlesInfoFilterStateCopyWith<_$_ArticlesInfoFilterState>
      get copyWith => throw _privateConstructorUsedError;
}
