// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_credits_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllCreditsFilter {
  DateTimeStringValue get documentDateFrom =>
      throw _privateConstructorUsedError;
  DateTimeStringValue get documentDateTo => throw _privateConstructorUsedError;
  RangeValue get amountValueFrom => throw _privateConstructorUsedError;
  RangeValue get amountValueTo => throw _privateConstructorUsedError;
  List<String> get filterStatuses => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllCreditsFilterCopyWith<AllCreditsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllCreditsFilterCopyWith<$Res> {
  factory $AllCreditsFilterCopyWith(
          AllCreditsFilter value, $Res Function(AllCreditsFilter) then) =
      _$AllCreditsFilterCopyWithImpl<$Res, AllCreditsFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue documentDateFrom,
      DateTimeStringValue documentDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      List<String> filterStatuses,
      SearchKey searchKey});
}

/// @nodoc
class _$AllCreditsFilterCopyWithImpl<$Res, $Val extends AllCreditsFilter>
    implements $AllCreditsFilterCopyWith<$Res> {
  _$AllCreditsFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentDateFrom = null,
    Object? documentDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterStatuses = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      documentDateFrom: null == documentDateFrom
          ? _value.documentDateFrom
          : documentDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      documentDateTo: null == documentDateTo
          ? _value.documentDateTo
          : documentDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      filterStatuses: null == filterStatuses
          ? _value.filterStatuses
          : filterStatuses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllCreditsFilterCopyWith<$Res>
    implements $AllCreditsFilterCopyWith<$Res> {
  factory _$$_AllCreditsFilterCopyWith(
          _$_AllCreditsFilter value, $Res Function(_$_AllCreditsFilter) then) =
      __$$_AllCreditsFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue documentDateFrom,
      DateTimeStringValue documentDateTo,
      RangeValue amountValueFrom,
      RangeValue amountValueTo,
      List<String> filterStatuses,
      SearchKey searchKey});
}

/// @nodoc
class __$$_AllCreditsFilterCopyWithImpl<$Res>
    extends _$AllCreditsFilterCopyWithImpl<$Res, _$_AllCreditsFilter>
    implements _$$_AllCreditsFilterCopyWith<$Res> {
  __$$_AllCreditsFilterCopyWithImpl(
      _$_AllCreditsFilter _value, $Res Function(_$_AllCreditsFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentDateFrom = null,
    Object? documentDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterStatuses = null,
    Object? searchKey = null,
  }) {
    return _then(_$_AllCreditsFilter(
      documentDateFrom: null == documentDateFrom
          ? _value.documentDateFrom
          : documentDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      documentDateTo: null == documentDateTo
          ? _value.documentDateTo
          : documentDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      filterStatuses: null == filterStatuses
          ? _value._filterStatuses
          : filterStatuses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_AllCreditsFilter extends _AllCreditsFilter {
  _$_AllCreditsFilter(
      {required this.documentDateFrom,
      required this.documentDateTo,
      required this.amountValueFrom,
      required this.amountValueTo,
      required final List<String> filterStatuses,
      required this.searchKey})
      : _filterStatuses = filterStatuses,
        super._();

  @override
  final DateTimeStringValue documentDateFrom;
  @override
  final DateTimeStringValue documentDateTo;
  @override
  final RangeValue amountValueFrom;
  @override
  final RangeValue amountValueTo;
  final List<String> _filterStatuses;
  @override
  List<String> get filterStatuses {
    if (_filterStatuses is EqualUnmodifiableListView) return _filterStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterStatuses);
  }

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'AllCreditsFilter(documentDateFrom: $documentDateFrom, documentDateTo: $documentDateTo, amountValueFrom: $amountValueFrom, amountValueTo: $amountValueTo, filterStatuses: $filterStatuses, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllCreditsFilter &&
            (identical(other.documentDateFrom, documentDateFrom) ||
                other.documentDateFrom == documentDateFrom) &&
            (identical(other.documentDateTo, documentDateTo) ||
                other.documentDateTo == documentDateTo) &&
            (identical(other.amountValueFrom, amountValueFrom) ||
                other.amountValueFrom == amountValueFrom) &&
            (identical(other.amountValueTo, amountValueTo) ||
                other.amountValueTo == amountValueTo) &&
            const DeepCollectionEquality()
                .equals(other._filterStatuses, _filterStatuses) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      documentDateFrom,
      documentDateTo,
      amountValueFrom,
      amountValueTo,
      const DeepCollectionEquality().hash(_filterStatuses),
      searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllCreditsFilterCopyWith<_$_AllCreditsFilter> get copyWith =>
      __$$_AllCreditsFilterCopyWithImpl<_$_AllCreditsFilter>(this, _$identity);
}

abstract class _AllCreditsFilter extends AllCreditsFilter {
  factory _AllCreditsFilter(
      {required final DateTimeStringValue documentDateFrom,
      required final DateTimeStringValue documentDateTo,
      required final RangeValue amountValueFrom,
      required final RangeValue amountValueTo,
      required final List<String> filterStatuses,
      required final SearchKey searchKey}) = _$_AllCreditsFilter;
  _AllCreditsFilter._() : super._();

  @override
  DateTimeStringValue get documentDateFrom;
  @override
  DateTimeStringValue get documentDateTo;
  @override
  RangeValue get amountValueFrom;
  @override
  RangeValue get amountValueTo;
  @override
  List<String> get filterStatuses;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$_AllCreditsFilterCopyWith<_$_AllCreditsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
