// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status_tracker_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderStatusTrackerDto _$OrderStatusTrackerDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderStatusTrackerDto.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusTrackerDto {
  @JsonKey(name: 'Actiom', defaultValue: '')
  String get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'StepName', defaultValue: '')
  String get stepName => throw _privateConstructorUsedError;
  @JsonKey(name: 'StepStape')
  String get stepStage => throw _privateConstructorUsedError;
  @JsonKey(name: 'State', defaultValue: '')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdateTimeStamp', defaultValue: '')
  String get updateTimeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusTrackerDtoCopyWith<OrderStatusTrackerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusTrackerDtoCopyWith<$Res> {
  factory $OrderStatusTrackerDtoCopyWith(OrderStatusTrackerDto value,
          $Res Function(OrderStatusTrackerDto) then) =
      _$OrderStatusTrackerDtoCopyWithImpl<$Res, OrderStatusTrackerDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Actiom', defaultValue: '') String action,
      @JsonKey(name: 'StepName', defaultValue: '') String stepName,
      @JsonKey(name: 'StepStape') String stepStage,
      @JsonKey(name: 'State', defaultValue: '') String state,
      @JsonKey(name: 'Status', defaultValue: '') String status,
      @JsonKey(name: 'UpdateTimeStamp', defaultValue: '')
      String updateTimeStamp});
}

/// @nodoc
class _$OrderStatusTrackerDtoCopyWithImpl<$Res,
        $Val extends OrderStatusTrackerDto>
    implements $OrderStatusTrackerDtoCopyWith<$Res> {
  _$OrderStatusTrackerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? stepName = null,
    Object? stepStage = null,
    Object? state = null,
    Object? status = null,
    Object? updateTimeStamp = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      stepName: null == stepName
          ? _value.stepName
          : stepName // ignore: cast_nullable_to_non_nullable
              as String,
      stepStage: null == stepStage
          ? _value.stepStage
          : stepStage // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updateTimeStamp: null == updateTimeStamp
          ? _value.updateTimeStamp
          : updateTimeStamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderStatusTrackerDtoCopyWith<$Res>
    implements $OrderStatusTrackerDtoCopyWith<$Res> {
  factory _$$_OrderStatusTrackerDtoCopyWith(_$_OrderStatusTrackerDto value,
          $Res Function(_$_OrderStatusTrackerDto) then) =
      __$$_OrderStatusTrackerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Actiom', defaultValue: '') String action,
      @JsonKey(name: 'StepName', defaultValue: '') String stepName,
      @JsonKey(name: 'StepStape') String stepStage,
      @JsonKey(name: 'State', defaultValue: '') String state,
      @JsonKey(name: 'Status', defaultValue: '') String status,
      @JsonKey(name: 'UpdateTimeStamp', defaultValue: '')
      String updateTimeStamp});
}

/// @nodoc
class __$$_OrderStatusTrackerDtoCopyWithImpl<$Res>
    extends _$OrderStatusTrackerDtoCopyWithImpl<$Res, _$_OrderStatusTrackerDto>
    implements _$$_OrderStatusTrackerDtoCopyWith<$Res> {
  __$$_OrderStatusTrackerDtoCopyWithImpl(_$_OrderStatusTrackerDto _value,
      $Res Function(_$_OrderStatusTrackerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? stepName = null,
    Object? stepStage = null,
    Object? state = null,
    Object? status = null,
    Object? updateTimeStamp = null,
  }) {
    return _then(_$_OrderStatusTrackerDto(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      stepName: null == stepName
          ? _value.stepName
          : stepName // ignore: cast_nullable_to_non_nullable
              as String,
      stepStage: null == stepStage
          ? _value.stepStage
          : stepStage // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updateTimeStamp: null == updateTimeStamp
          ? _value.updateTimeStamp
          : updateTimeStamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderStatusTrackerDto extends _OrderStatusTrackerDto {
  const _$_OrderStatusTrackerDto(
      {@JsonKey(name: 'Actiom', defaultValue: '') required this.action,
      @JsonKey(name: 'StepName', defaultValue: '') required this.stepName,
      @JsonKey(name: 'StepStape') required this.stepStage,
      @JsonKey(name: 'State', defaultValue: '') required this.state,
      @JsonKey(name: 'Status', defaultValue: '') required this.status,
      @JsonKey(name: 'UpdateTimeStamp', defaultValue: '')
      required this.updateTimeStamp})
      : super._();

  factory _$_OrderStatusTrackerDto.fromJson(Map<String, dynamic> json) =>
      _$$_OrderStatusTrackerDtoFromJson(json);

  @override
  @JsonKey(name: 'Actiom', defaultValue: '')
  final String action;
  @override
  @JsonKey(name: 'StepName', defaultValue: '')
  final String stepName;
  @override
  @JsonKey(name: 'StepStape')
  final String stepStage;
  @override
  @JsonKey(name: 'State', defaultValue: '')
  final String state;
  @override
  @JsonKey(name: 'Status', defaultValue: '')
  final String status;
  @override
  @JsonKey(name: 'UpdateTimeStamp', defaultValue: '')
  final String updateTimeStamp;

  @override
  String toString() {
    return 'OrderStatusTrackerDto(action: $action, stepName: $stepName, stepStage: $stepStage, state: $state, status: $status, updateTimeStamp: $updateTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderStatusTrackerDto &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.stepName, stepName) ||
                other.stepName == stepName) &&
            (identical(other.stepStage, stepStage) ||
                other.stepStage == stepStage) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updateTimeStamp, updateTimeStamp) ||
                other.updateTimeStamp == updateTimeStamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, action, stepName, stepStage, state, status, updateTimeStamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderStatusTrackerDtoCopyWith<_$_OrderStatusTrackerDto> get copyWith =>
      __$$_OrderStatusTrackerDtoCopyWithImpl<_$_OrderStatusTrackerDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderStatusTrackerDtoToJson(
      this,
    );
  }
}

abstract class _OrderStatusTrackerDto extends OrderStatusTrackerDto {
  const factory _OrderStatusTrackerDto(
      {@JsonKey(name: 'Actiom', defaultValue: '') required final String action,
      @JsonKey(name: 'StepName', defaultValue: '')
      required final String stepName,
      @JsonKey(name: 'StepStape') required final String stepStage,
      @JsonKey(name: 'State', defaultValue: '') required final String state,
      @JsonKey(name: 'Status', defaultValue: '') required final String status,
      @JsonKey(name: 'UpdateTimeStamp', defaultValue: '')
      required final String updateTimeStamp}) = _$_OrderStatusTrackerDto;
  const _OrderStatusTrackerDto._() : super._();

  factory _OrderStatusTrackerDto.fromJson(Map<String, dynamic> json) =
      _$_OrderStatusTrackerDto.fromJson;

  @override
  @JsonKey(name: 'Actiom', defaultValue: '')
  String get action;
  @override
  @JsonKey(name: 'StepName', defaultValue: '')
  String get stepName;
  @override
  @JsonKey(name: 'StepStape')
  String get stepStage;
  @override
  @JsonKey(name: 'State', defaultValue: '')
  String get state;
  @override
  @JsonKey(name: 'Status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'UpdateTimeStamp', defaultValue: '')
  String get updateTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$$_OrderStatusTrackerDtoCopyWith<_$_OrderStatusTrackerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
