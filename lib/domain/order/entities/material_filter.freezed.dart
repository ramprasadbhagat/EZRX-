// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialFilter {
  List<String> get uniquePrincipalName => throw _privateConstructorUsedError;
  List<String> get uniqueTherapeuticClass => throw _privateConstructorUsedError;
  List<String> get uniqueItemBrand => throw _privateConstructorUsedError;
  bool get isFavourite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialFilterCopyWith<MaterialFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialFilterCopyWith<$Res> {
  factory $MaterialFilterCopyWith(
          MaterialFilter value, $Res Function(MaterialFilter) then) =
      _$MaterialFilterCopyWithImpl<$Res, MaterialFilter>;
  @useResult
  $Res call(
      {List<String> uniquePrincipalName,
      List<String> uniqueTherapeuticClass,
      List<String> uniqueItemBrand,
      bool isFavourite});
}

/// @nodoc
class _$MaterialFilterCopyWithImpl<$Res, $Val extends MaterialFilter>
    implements $MaterialFilterCopyWith<$Res> {
  _$MaterialFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniquePrincipalName = null,
    Object? uniqueTherapeuticClass = null,
    Object? uniqueItemBrand = null,
    Object? isFavourite = null,
  }) {
    return _then(_value.copyWith(
      uniquePrincipalName: null == uniquePrincipalName
          ? _value.uniquePrincipalName
          : uniquePrincipalName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueTherapeuticClass: null == uniqueTherapeuticClass
          ? _value.uniqueTherapeuticClass
          : uniqueTherapeuticClass // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueItemBrand: null == uniqueItemBrand
          ? _value.uniqueItemBrand
          : uniqueItemBrand // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialFilterCopyWith<$Res>
    implements $MaterialFilterCopyWith<$Res> {
  factory _$$_MaterialFilterCopyWith(
          _$_MaterialFilter value, $Res Function(_$_MaterialFilter) then) =
      __$$_MaterialFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> uniquePrincipalName,
      List<String> uniqueTherapeuticClass,
      List<String> uniqueItemBrand,
      bool isFavourite});
}

/// @nodoc
class __$$_MaterialFilterCopyWithImpl<$Res>
    extends _$MaterialFilterCopyWithImpl<$Res, _$_MaterialFilter>
    implements _$$_MaterialFilterCopyWith<$Res> {
  __$$_MaterialFilterCopyWithImpl(
      _$_MaterialFilter _value, $Res Function(_$_MaterialFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniquePrincipalName = null,
    Object? uniqueTherapeuticClass = null,
    Object? uniqueItemBrand = null,
    Object? isFavourite = null,
  }) {
    return _then(_$_MaterialFilter(
      uniquePrincipalName: null == uniquePrincipalName
          ? _value._uniquePrincipalName
          : uniquePrincipalName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueTherapeuticClass: null == uniqueTherapeuticClass
          ? _value._uniqueTherapeuticClass
          : uniqueTherapeuticClass // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueItemBrand: null == uniqueItemBrand
          ? _value._uniqueItemBrand
          : uniqueItemBrand // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MaterialFilter extends _MaterialFilter {
  const _$_MaterialFilter(
      {required final List<String> uniquePrincipalName,
      required final List<String> uniqueTherapeuticClass,
      required final List<String> uniqueItemBrand,
      this.isFavourite = false})
      : _uniquePrincipalName = uniquePrincipalName,
        _uniqueTherapeuticClass = uniqueTherapeuticClass,
        _uniqueItemBrand = uniqueItemBrand,
        super._();

  final List<String> _uniquePrincipalName;
  @override
  List<String> get uniquePrincipalName {
    if (_uniquePrincipalName is EqualUnmodifiableListView)
      return _uniquePrincipalName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniquePrincipalName);
  }

  final List<String> _uniqueTherapeuticClass;
  @override
  List<String> get uniqueTherapeuticClass {
    if (_uniqueTherapeuticClass is EqualUnmodifiableListView)
      return _uniqueTherapeuticClass;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniqueTherapeuticClass);
  }

  final List<String> _uniqueItemBrand;
  @override
  List<String> get uniqueItemBrand {
    if (_uniqueItemBrand is EqualUnmodifiableListView) return _uniqueItemBrand;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniqueItemBrand);
  }

  @override
  @JsonKey()
  final bool isFavourite;

  @override
  String toString() {
    return 'MaterialFilter(uniquePrincipalName: $uniquePrincipalName, uniqueTherapeuticClass: $uniqueTherapeuticClass, uniqueItemBrand: $uniqueItemBrand, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialFilter &&
            const DeepCollectionEquality()
                .equals(other._uniquePrincipalName, _uniquePrincipalName) &&
            const DeepCollectionEquality().equals(
                other._uniqueTherapeuticClass, _uniqueTherapeuticClass) &&
            const DeepCollectionEquality()
                .equals(other._uniqueItemBrand, _uniqueItemBrand) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_uniquePrincipalName),
      const DeepCollectionEquality().hash(_uniqueTherapeuticClass),
      const DeepCollectionEquality().hash(_uniqueItemBrand),
      isFavourite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialFilterCopyWith<_$_MaterialFilter> get copyWith =>
      __$$_MaterialFilterCopyWithImpl<_$_MaterialFilter>(this, _$identity);
}

abstract class _MaterialFilter extends MaterialFilter {
  const factory _MaterialFilter(
      {required final List<String> uniquePrincipalName,
      required final List<String> uniqueTherapeuticClass,
      required final List<String> uniqueItemBrand,
      final bool isFavourite}) = _$_MaterialFilter;
  const _MaterialFilter._() : super._();

  @override
  List<String> get uniquePrincipalName;
  @override
  List<String> get uniqueTherapeuticClass;
  @override
  List<String> get uniqueItemBrand;
  @override
  bool get isFavourite;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialFilterCopyWith<_$_MaterialFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
