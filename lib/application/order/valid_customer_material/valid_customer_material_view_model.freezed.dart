// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'valid_customer_material_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValidCustomerMaterialViewModel {
  List<MaterialNumber> get validMaterialNumbers =>
      throw _privateConstructorUsedError;
  ValidatingStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValidCustomerMaterialViewModelCopyWith<ValidCustomerMaterialViewModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidCustomerMaterialViewModelCopyWith<$Res> {
  factory $ValidCustomerMaterialViewModelCopyWith(
          ValidCustomerMaterialViewModel value,
          $Res Function(ValidCustomerMaterialViewModel) then) =
      _$ValidCustomerMaterialViewModelCopyWithImpl<$Res>;
  $Res call(
      {List<MaterialNumber> validMaterialNumbers, ValidatingStatus status});
}

/// @nodoc
class _$ValidCustomerMaterialViewModelCopyWithImpl<$Res>
    implements $ValidCustomerMaterialViewModelCopyWith<$Res> {
  _$ValidCustomerMaterialViewModelCopyWithImpl(this._value, this._then);

  final ValidCustomerMaterialViewModel _value;
  // ignore: unused_field
  final $Res Function(ValidCustomerMaterialViewModel) _then;

  @override
  $Res call({
    Object? validMaterialNumbers = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      validMaterialNumbers: validMaterialNumbers == freezed
          ? _value.validMaterialNumbers
          : validMaterialNumbers // ignore: cast_nullable_to_non_nullable
              as List<MaterialNumber>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ValidatingStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_ValidCustomerMaterialViewModelCopyWith<$Res>
    implements $ValidCustomerMaterialViewModelCopyWith<$Res> {
  factory _$$_ValidCustomerMaterialViewModelCopyWith(
          _$_ValidCustomerMaterialViewModel value,
          $Res Function(_$_ValidCustomerMaterialViewModel) then) =
      __$$_ValidCustomerMaterialViewModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<MaterialNumber> validMaterialNumbers, ValidatingStatus status});
}

/// @nodoc
class __$$_ValidCustomerMaterialViewModelCopyWithImpl<$Res>
    extends _$ValidCustomerMaterialViewModelCopyWithImpl<$Res>
    implements _$$_ValidCustomerMaterialViewModelCopyWith<$Res> {
  __$$_ValidCustomerMaterialViewModelCopyWithImpl(
      _$_ValidCustomerMaterialViewModel _value,
      $Res Function(_$_ValidCustomerMaterialViewModel) _then)
      : super(_value, (v) => _then(v as _$_ValidCustomerMaterialViewModel));

  @override
  _$_ValidCustomerMaterialViewModel get _value =>
      super._value as _$_ValidCustomerMaterialViewModel;

  @override
  $Res call({
    Object? validMaterialNumbers = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ValidCustomerMaterialViewModel(
      validMaterialNumbers: validMaterialNumbers == freezed
          ? _value._validMaterialNumbers
          : validMaterialNumbers // ignore: cast_nullable_to_non_nullable
              as List<MaterialNumber>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ValidatingStatus,
    ));
  }
}

/// @nodoc

class _$_ValidCustomerMaterialViewModel
    extends _ValidCustomerMaterialViewModel {
  const _$_ValidCustomerMaterialViewModel(
      {final List<MaterialNumber> validMaterialNumbers =
          const <MaterialNumber>[],
      required this.status})
      : _validMaterialNumbers = validMaterialNumbers,
        super._();

  final List<MaterialNumber> _validMaterialNumbers;
  @override
  @JsonKey()
  List<MaterialNumber> get validMaterialNumbers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validMaterialNumbers);
  }

  @override
  final ValidatingStatus status;

  @override
  String toString() {
    return 'ValidCustomerMaterialViewModel(validMaterialNumbers: $validMaterialNumbers, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidCustomerMaterialViewModel &&
            const DeepCollectionEquality()
                .equals(other._validMaterialNumbers, _validMaterialNumbers) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_validMaterialNumbers),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ValidCustomerMaterialViewModelCopyWith<_$_ValidCustomerMaterialViewModel>
      get copyWith => __$$_ValidCustomerMaterialViewModelCopyWithImpl<
          _$_ValidCustomerMaterialViewModel>(this, _$identity);
}

abstract class _ValidCustomerMaterialViewModel
    extends ValidCustomerMaterialViewModel {
  const factory _ValidCustomerMaterialViewModel(
          {final List<MaterialNumber> validMaterialNumbers,
          required final ValidatingStatus status}) =
      _$_ValidCustomerMaterialViewModel;
  const _ValidCustomerMaterialViewModel._() : super._();

  @override
  List<MaterialNumber> get validMaterialNumbers;
  @override
  ValidatingStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_ValidCustomerMaterialViewModelCopyWith<_$_ValidCustomerMaterialViewModel>
      get copyWith => throw _privateConstructorUsedError;
}
