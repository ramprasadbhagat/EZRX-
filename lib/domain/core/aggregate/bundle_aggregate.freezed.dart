// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bundle_aggregate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BundleAggregate {
  Bundle get bundle => throw _privateConstructorUsedError;
  List<MaterialInfo> get materialInfos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BundleAggregateCopyWith<BundleAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleAggregateCopyWith<$Res> {
  factory $BundleAggregateCopyWith(
          BundleAggregate value, $Res Function(BundleAggregate) then) =
      _$BundleAggregateCopyWithImpl<$Res, BundleAggregate>;
  @useResult
  $Res call({Bundle bundle, List<MaterialInfo> materialInfos});

  $BundleCopyWith<$Res> get bundle;
}

/// @nodoc
class _$BundleAggregateCopyWithImpl<$Res, $Val extends BundleAggregate>
    implements $BundleAggregateCopyWith<$Res> {
  _$BundleAggregateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundle = null,
    Object? materialInfos = null,
  }) {
    return _then(_value.copyWith(
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as Bundle,
      materialInfos: null == materialInfos
          ? _value.materialInfos
          : materialInfos // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BundleCopyWith<$Res> get bundle {
    return $BundleCopyWith<$Res>(_value.bundle, (value) {
      return _then(_value.copyWith(bundle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BundleAggregateCopyWith<$Res>
    implements $BundleAggregateCopyWith<$Res> {
  factory _$$_BundleAggregateCopyWith(
          _$_BundleAggregate value, $Res Function(_$_BundleAggregate) then) =
      __$$_BundleAggregateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Bundle bundle, List<MaterialInfo> materialInfos});

  @override
  $BundleCopyWith<$Res> get bundle;
}

/// @nodoc
class __$$_BundleAggregateCopyWithImpl<$Res>
    extends _$BundleAggregateCopyWithImpl<$Res, _$_BundleAggregate>
    implements _$$_BundleAggregateCopyWith<$Res> {
  __$$_BundleAggregateCopyWithImpl(
      _$_BundleAggregate _value, $Res Function(_$_BundleAggregate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundle = null,
    Object? materialInfos = null,
  }) {
    return _then(_$_BundleAggregate(
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as Bundle,
      materialInfos: null == materialInfos
          ? _value._materialInfos
          : materialInfos // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ));
  }
}

/// @nodoc

class _$_BundleAggregate extends _BundleAggregate {
  const _$_BundleAggregate(
      {required this.bundle, required final List<MaterialInfo> materialInfos})
      : _materialInfos = materialInfos,
        super._();

  @override
  final Bundle bundle;
  final List<MaterialInfo> _materialInfos;
  @override
  List<MaterialInfo> get materialInfos {
    if (_materialInfos is EqualUnmodifiableListView) return _materialInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialInfos);
  }

  @override
  String toString() {
    return 'BundleAggregate(bundle: $bundle, materialInfos: $materialInfos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BundleAggregate &&
            (identical(other.bundle, bundle) || other.bundle == bundle) &&
            const DeepCollectionEquality()
                .equals(other._materialInfos, _materialInfos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bundle, const DeepCollectionEquality().hash(_materialInfos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BundleAggregateCopyWith<_$_BundleAggregate> get copyWith =>
      __$$_BundleAggregateCopyWithImpl<_$_BundleAggregate>(this, _$identity);
}

abstract class _BundleAggregate extends BundleAggregate {
  const factory _BundleAggregate(
      {required final Bundle bundle,
      required final List<MaterialInfo> materialInfos}) = _$_BundleAggregate;
  const _BundleAggregate._() : super._();

  @override
  Bundle get bundle;
  @override
  List<MaterialInfo> get materialInfos;
  @override
  @JsonKey(ignore: true)
  _$$_BundleAggregateCopyWith<_$_BundleAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}
