// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_summary_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnSummaryRequestDto _$ReturnSummaryRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnSummaryRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnSummaryRequestDto {
  @JsonKey(name: 'requestStatus', defaultValue: '')
  String get requestStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'submitDate', defaultValue: '')
  String get submitDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnId', defaultValue: '')
  String get returnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'refundTotal', defaultValue: '')
  String get refundTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'items', defaultValue: [])
  List<ReturnSummaryRequestItemsDto> get items =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnSummaryRequestDtoCopyWith<ReturnSummaryRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryRequestDtoCopyWith<$Res> {
  factory $ReturnSummaryRequestDtoCopyWith(ReturnSummaryRequestDto value,
          $Res Function(ReturnSummaryRequestDto) then) =
      _$ReturnSummaryRequestDtoCopyWithImpl<$Res, ReturnSummaryRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestStatus', defaultValue: '')
          String requestStatus,
      @JsonKey(name: 'submitDate', defaultValue: '')
          String submitDate,
      @JsonKey(name: 'returnId', defaultValue: '')
          String returnId,
      @JsonKey(name: 'refundTotal', defaultValue: '')
          String refundTotal,
      @JsonKey(name: 'items', defaultValue: [])
          List<ReturnSummaryRequestItemsDto> items});
}

/// @nodoc
class _$ReturnSummaryRequestDtoCopyWithImpl<$Res,
        $Val extends ReturnSummaryRequestDto>
    implements $ReturnSummaryRequestDtoCopyWith<$Res> {
  _$ReturnSummaryRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestStatus = null,
    Object? submitDate = null,
    Object? returnId = null,
    Object? refundTotal = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      requestStatus: null == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as String,
      submitDate: null == submitDate
          ? _value.submitDate
          : submitDate // ignore: cast_nullable_to_non_nullable
              as String,
      returnId: null == returnId
          ? _value.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotal: null == refundTotal
          ? _value.refundTotal
          : refundTotal // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnSummaryRequestItemsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryRequestDtoCopyWith<$Res>
    implements $ReturnSummaryRequestDtoCopyWith<$Res> {
  factory _$$_ReturnSummaryRequestDtoCopyWith(_$_ReturnSummaryRequestDto value,
          $Res Function(_$_ReturnSummaryRequestDto) then) =
      __$$_ReturnSummaryRequestDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestStatus', defaultValue: '')
          String requestStatus,
      @JsonKey(name: 'submitDate', defaultValue: '')
          String submitDate,
      @JsonKey(name: 'returnId', defaultValue: '')
          String returnId,
      @JsonKey(name: 'refundTotal', defaultValue: '')
          String refundTotal,
      @JsonKey(name: 'items', defaultValue: [])
          List<ReturnSummaryRequestItemsDto> items});
}

/// @nodoc
class __$$_ReturnSummaryRequestDtoCopyWithImpl<$Res>
    extends _$ReturnSummaryRequestDtoCopyWithImpl<$Res,
        _$_ReturnSummaryRequestDto>
    implements _$$_ReturnSummaryRequestDtoCopyWith<$Res> {
  __$$_ReturnSummaryRequestDtoCopyWithImpl(_$_ReturnSummaryRequestDto _value,
      $Res Function(_$_ReturnSummaryRequestDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestStatus = null,
    Object? submitDate = null,
    Object? returnId = null,
    Object? refundTotal = null,
    Object? items = null,
  }) {
    return _then(_$_ReturnSummaryRequestDto(
      requestStatus: null == requestStatus
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as String,
      submitDate: null == submitDate
          ? _value.submitDate
          : submitDate // ignore: cast_nullable_to_non_nullable
              as String,
      returnId: null == returnId
          ? _value.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotal: null == refundTotal
          ? _value.refundTotal
          : refundTotal // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnSummaryRequestItemsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnSummaryRequestDto extends _ReturnSummaryRequestDto {
  const _$_ReturnSummaryRequestDto(
      {@JsonKey(name: 'requestStatus', defaultValue: '')
          required this.requestStatus,
      @JsonKey(name: 'submitDate', defaultValue: '')
          required this.submitDate,
      @JsonKey(name: 'returnId', defaultValue: '')
          required this.returnId,
      @JsonKey(name: 'refundTotal', defaultValue: '')
          required this.refundTotal,
      @JsonKey(name: 'items', defaultValue: [])
          required final List<ReturnSummaryRequestItemsDto> items})
      : _items = items,
        super._();

  factory _$_ReturnSummaryRequestDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnSummaryRequestDtoFromJson(json);

  @override
  @JsonKey(name: 'requestStatus', defaultValue: '')
  final String requestStatus;
  @override
  @JsonKey(name: 'submitDate', defaultValue: '')
  final String submitDate;
  @override
  @JsonKey(name: 'returnId', defaultValue: '')
  final String returnId;
  @override
  @JsonKey(name: 'refundTotal', defaultValue: '')
  final String refundTotal;
  final List<ReturnSummaryRequestItemsDto> _items;
  @override
  @JsonKey(name: 'items', defaultValue: [])
  List<ReturnSummaryRequestItemsDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ReturnSummaryRequestDto(requestStatus: $requestStatus, submitDate: $submitDate, returnId: $returnId, refundTotal: $refundTotal, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSummaryRequestDto &&
            (identical(other.requestStatus, requestStatus) ||
                other.requestStatus == requestStatus) &&
            (identical(other.submitDate, submitDate) ||
                other.submitDate == submitDate) &&
            (identical(other.returnId, returnId) ||
                other.returnId == returnId) &&
            (identical(other.refundTotal, refundTotal) ||
                other.refundTotal == refundTotal) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestStatus, submitDate,
      returnId, refundTotal, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryRequestDtoCopyWith<_$_ReturnSummaryRequestDto>
      get copyWith =>
          __$$_ReturnSummaryRequestDtoCopyWithImpl<_$_ReturnSummaryRequestDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnSummaryRequestDtoToJson(
      this,
    );
  }
}

abstract class _ReturnSummaryRequestDto extends ReturnSummaryRequestDto {
  const factory _ReturnSummaryRequestDto(
          {@JsonKey(name: 'requestStatus', defaultValue: '')
              required final String requestStatus,
          @JsonKey(name: 'submitDate', defaultValue: '')
              required final String submitDate,
          @JsonKey(name: 'returnId', defaultValue: '')
              required final String returnId,
          @JsonKey(name: 'refundTotal', defaultValue: '')
              required final String refundTotal,
          @JsonKey(name: 'items', defaultValue: [])
              required final List<ReturnSummaryRequestItemsDto> items}) =
      _$_ReturnSummaryRequestDto;
  const _ReturnSummaryRequestDto._() : super._();

  factory _ReturnSummaryRequestDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnSummaryRequestDto.fromJson;

  @override
  @JsonKey(name: 'requestStatus', defaultValue: '')
  String get requestStatus;
  @override
  @JsonKey(name: 'submitDate', defaultValue: '')
  String get submitDate;
  @override
  @JsonKey(name: 'returnId', defaultValue: '')
  String get returnId;
  @override
  @JsonKey(name: 'refundTotal', defaultValue: '')
  String get refundTotal;
  @override
  @JsonKey(name: 'items', defaultValue: [])
  List<ReturnSummaryRequestItemsDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryRequestDtoCopyWith<_$_ReturnSummaryRequestDto>
      get copyWith => throw _privateConstructorUsedError;
}
