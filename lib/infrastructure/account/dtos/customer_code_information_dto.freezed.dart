// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_code_information_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerInformationDTO _$CustomerInformationDTOFromJson(
    Map<String, dynamic> json) {
  return _CustomerInformationDTO.fromJson(json);
}

/// @nodoc
mixin _$CustomerInformationDTO {
  @JsonKey(name: 'shipToCount', defaultValue: 0)
  int get shipToCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'SoldToInformation', defaultValue: [])
  List<CustomerCodeDto> get soldToInformation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerInformationDTOCopyWith<CustomerInformationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInformationDTOCopyWith<$Res> {
  factory $CustomerInformationDTOCopyWith(CustomerInformationDTO value,
          $Res Function(CustomerInformationDTO) then) =
      _$CustomerInformationDTOCopyWithImpl<$Res, CustomerInformationDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'shipToCount', defaultValue: 0) int shipToCount,
      @JsonKey(name: 'SoldToInformation', defaultValue: [])
      List<CustomerCodeDto> soldToInformation});
}

/// @nodoc
class _$CustomerInformationDTOCopyWithImpl<$Res,
        $Val extends CustomerInformationDTO>
    implements $CustomerInformationDTOCopyWith<$Res> {
  _$CustomerInformationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipToCount = null,
    Object? soldToInformation = null,
  }) {
    return _then(_value.copyWith(
      shipToCount: null == shipToCount
          ? _value.shipToCount
          : shipToCount // ignore: cast_nullable_to_non_nullable
              as int,
      soldToInformation: null == soldToInformation
          ? _value.soldToInformation
          : soldToInformation // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerInformationDTOCopyWith<$Res>
    implements $CustomerInformationDTOCopyWith<$Res> {
  factory _$$_CustomerInformationDTOCopyWith(_$_CustomerInformationDTO value,
          $Res Function(_$_CustomerInformationDTO) then) =
      __$$_CustomerInformationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'shipToCount', defaultValue: 0) int shipToCount,
      @JsonKey(name: 'SoldToInformation', defaultValue: [])
      List<CustomerCodeDto> soldToInformation});
}

/// @nodoc
class __$$_CustomerInformationDTOCopyWithImpl<$Res>
    extends _$CustomerInformationDTOCopyWithImpl<$Res,
        _$_CustomerInformationDTO>
    implements _$$_CustomerInformationDTOCopyWith<$Res> {
  __$$_CustomerInformationDTOCopyWithImpl(_$_CustomerInformationDTO _value,
      $Res Function(_$_CustomerInformationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipToCount = null,
    Object? soldToInformation = null,
  }) {
    return _then(_$_CustomerInformationDTO(
      shipToCount: null == shipToCount
          ? _value.shipToCount
          : shipToCount // ignore: cast_nullable_to_non_nullable
              as int,
      soldToInformation: null == soldToInformation
          ? _value._soldToInformation
          : soldToInformation // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerInformationDTO extends _CustomerInformationDTO {
  const _$_CustomerInformationDTO(
      {@JsonKey(name: 'shipToCount', defaultValue: 0) required this.shipToCount,
      @JsonKey(name: 'SoldToInformation', defaultValue: [])
      required final List<CustomerCodeDto> soldToInformation})
      : _soldToInformation = soldToInformation,
        super._();

  factory _$_CustomerInformationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerInformationDTOFromJson(json);

  @override
  @JsonKey(name: 'shipToCount', defaultValue: 0)
  final int shipToCount;
  final List<CustomerCodeDto> _soldToInformation;
  @override
  @JsonKey(name: 'SoldToInformation', defaultValue: [])
  List<CustomerCodeDto> get soldToInformation {
    if (_soldToInformation is EqualUnmodifiableListView)
      return _soldToInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soldToInformation);
  }

  @override
  String toString() {
    return 'CustomerInformationDTO(shipToCount: $shipToCount, soldToInformation: $soldToInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerInformationDTO &&
            (identical(other.shipToCount, shipToCount) ||
                other.shipToCount == shipToCount) &&
            const DeepCollectionEquality()
                .equals(other._soldToInformation, _soldToInformation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shipToCount,
      const DeepCollectionEquality().hash(_soldToInformation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerInformationDTOCopyWith<_$_CustomerInformationDTO> get copyWith =>
      __$$_CustomerInformationDTOCopyWithImpl<_$_CustomerInformationDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerInformationDTOToJson(
      this,
    );
  }
}

abstract class _CustomerInformationDTO extends CustomerInformationDTO {
  const factory _CustomerInformationDTO(
          {@JsonKey(name: 'shipToCount', defaultValue: 0)
          required final int shipToCount,
          @JsonKey(name: 'SoldToInformation', defaultValue: [])
          required final List<CustomerCodeDto> soldToInformation}) =
      _$_CustomerInformationDTO;
  const _CustomerInformationDTO._() : super._();

  factory _CustomerInformationDTO.fromJson(Map<String, dynamic> json) =
      _$_CustomerInformationDTO.fromJson;

  @override
  @JsonKey(name: 'shipToCount', defaultValue: 0)
  int get shipToCount;
  @override
  @JsonKey(name: 'SoldToInformation', defaultValue: [])
  List<CustomerCodeDto> get soldToInformation;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerInformationDTOCopyWith<_$_CustomerInformationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
