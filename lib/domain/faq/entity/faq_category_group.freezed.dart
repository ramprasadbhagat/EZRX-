// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_category_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FAQCategoryGroup {
  String get displayName => throw _privateConstructorUsedError;
  List<FAQItem> get faqItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FAQCategoryGroupCopyWith<FAQCategoryGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQCategoryGroupCopyWith<$Res> {
  factory $FAQCategoryGroupCopyWith(
          FAQCategoryGroup value, $Res Function(FAQCategoryGroup) then) =
      _$FAQCategoryGroupCopyWithImpl<$Res, FAQCategoryGroup>;
  @useResult
  $Res call({String displayName, List<FAQItem> faqItem});
}

/// @nodoc
class _$FAQCategoryGroupCopyWithImpl<$Res, $Val extends FAQCategoryGroup>
    implements $FAQCategoryGroupCopyWith<$Res> {
  _$FAQCategoryGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? faqItem = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      faqItem: null == faqItem
          ? _value.faqItem
          : faqItem // ignore: cast_nullable_to_non_nullable
              as List<FAQItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FAQCategoryGroupCopyWith<$Res>
    implements $FAQCategoryGroupCopyWith<$Res> {
  factory _$$_FAQCategoryGroupCopyWith(
          _$_FAQCategoryGroup value, $Res Function(_$_FAQCategoryGroup) then) =
      __$$_FAQCategoryGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayName, List<FAQItem> faqItem});
}

/// @nodoc
class __$$_FAQCategoryGroupCopyWithImpl<$Res>
    extends _$FAQCategoryGroupCopyWithImpl<$Res, _$_FAQCategoryGroup>
    implements _$$_FAQCategoryGroupCopyWith<$Res> {
  __$$_FAQCategoryGroupCopyWithImpl(
      _$_FAQCategoryGroup _value, $Res Function(_$_FAQCategoryGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? faqItem = null,
  }) {
    return _then(_$_FAQCategoryGroup(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      faqItem: null == faqItem
          ? _value._faqItem
          : faqItem // ignore: cast_nullable_to_non_nullable
              as List<FAQItem>,
    ));
  }
}

/// @nodoc

class _$_FAQCategoryGroup implements _FAQCategoryGroup {
  _$_FAQCategoryGroup(
      {required this.displayName, required final List<FAQItem> faqItem})
      : _faqItem = faqItem;

  @override
  final String displayName;
  final List<FAQItem> _faqItem;
  @override
  List<FAQItem> get faqItem {
    if (_faqItem is EqualUnmodifiableListView) return _faqItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqItem);
  }

  @override
  String toString() {
    return 'FAQCategoryGroup(displayName: $displayName, faqItem: $faqItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FAQCategoryGroup &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            const DeepCollectionEquality().equals(other._faqItem, _faqItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, displayName, const DeepCollectionEquality().hash(_faqItem));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FAQCategoryGroupCopyWith<_$_FAQCategoryGroup> get copyWith =>
      __$$_FAQCategoryGroupCopyWithImpl<_$_FAQCategoryGroup>(this, _$identity);
}

abstract class _FAQCategoryGroup implements FAQCategoryGroup {
  factory _FAQCategoryGroup(
      {required final String displayName,
      required final List<FAQItem> faqItem}) = _$_FAQCategoryGroup;

  @override
  String get displayName;
  @override
  List<FAQItem> get faqItem;
  @override
  @JsonKey(ignore: true)
  _$$_FAQCategoryGroupCopyWith<_$_FAQCategoryGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
