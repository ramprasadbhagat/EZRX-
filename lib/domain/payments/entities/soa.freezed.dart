// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soa.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Soa {
  SoaData get soaData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SoaCopyWith<Soa> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoaCopyWith<$Res> {
  factory $SoaCopyWith(Soa value, $Res Function(Soa) then) =
      _$SoaCopyWithImpl<$Res, Soa>;
  @useResult
  $Res call({SoaData soaData});
}

/// @nodoc
class _$SoaCopyWithImpl<$Res, $Val extends Soa> implements $SoaCopyWith<$Res> {
  _$SoaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soaData = null,
  }) {
    return _then(_value.copyWith(
      soaData: null == soaData
          ? _value.soaData
          : soaData // ignore: cast_nullable_to_non_nullable
              as SoaData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SoaCopyWith<$Res> implements $SoaCopyWith<$Res> {
  factory _$$_SoaCopyWith(_$_Soa value, $Res Function(_$_Soa) then) =
      __$$_SoaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SoaData soaData});
}

/// @nodoc
class __$$_SoaCopyWithImpl<$Res> extends _$SoaCopyWithImpl<$Res, _$_Soa>
    implements _$$_SoaCopyWith<$Res> {
  __$$_SoaCopyWithImpl(_$_Soa _value, $Res Function(_$_Soa) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soaData = null,
  }) {
    return _then(_$_Soa(
      soaData: null == soaData
          ? _value.soaData
          : soaData // ignore: cast_nullable_to_non_nullable
              as SoaData,
    ));
  }
}

/// @nodoc

class _$_Soa implements _Soa {
  _$_Soa({required this.soaData});

  @override
  final SoaData soaData;

  @override
  String toString() {
    return 'Soa(soaData: $soaData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Soa &&
            (identical(other.soaData, soaData) || other.soaData == soaData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, soaData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SoaCopyWith<_$_Soa> get copyWith =>
      __$$_SoaCopyWithImpl<_$_Soa>(this, _$identity);
}

abstract class _Soa implements Soa {
  factory _Soa({required final SoaData soaData}) = _$_Soa;

  @override
  SoaData get soaData;
  @override
  @JsonKey(ignore: true)
  _$$_SoaCopyWith<_$_Soa> get copyWith => throw _privateConstructorUsedError;
}
