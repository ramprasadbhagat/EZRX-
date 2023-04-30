// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_customer_information_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentCustomerInformationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customeCodeInfo,
            SalesOrganisation salesOrganisation, String selectedShipToCode)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customeCodeInfo,
            SalesOrganisation salesOrganisation, String selectedShipToCode)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customeCodeInfo,
            SalesOrganisation salesOrganisation, String selectedShipToCode)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCustomerInformationEventCopyWith<$Res> {
  factory $PaymentCustomerInformationEventCopyWith(
          PaymentCustomerInformationEvent value,
          $Res Function(PaymentCustomerInformationEvent) then) =
      _$PaymentCustomerInformationEventCopyWithImpl<$Res,
          PaymentCustomerInformationEvent>;
}

/// @nodoc
class _$PaymentCustomerInformationEventCopyWithImpl<$Res,
        $Val extends PaymentCustomerInformationEvent>
    implements $PaymentCustomerInformationEventCopyWith<$Res> {
  _$PaymentCustomerInformationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$PaymentCustomerInformationEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'PaymentCustomerInformationEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customeCodeInfo,
            SalesOrganisation salesOrganisation, String selectedShipToCode)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customeCodeInfo,
            SalesOrganisation salesOrganisation, String selectedShipToCode)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customeCodeInfo,
            SalesOrganisation salesOrganisation, String selectedShipToCode)?
        fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PaymentCustomerInformationEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CustomerCodeInfo customeCodeInfo,
      SalesOrganisation salesOrganisation,
      String selectedShipToCode});

  $CustomerCodeInfoCopyWith<$Res> get customeCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$PaymentCustomerInformationEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customeCodeInfo = null,
    Object? salesOrganisation = null,
    Object? selectedShipToCode = null,
  }) {
    return _then(_$_Fetch(
      customeCodeInfo: null == customeCodeInfo
          ? _value.customeCodeInfo
          : customeCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      selectedShipToCode: null == selectedShipToCode
          ? _value.selectedShipToCode
          : selectedShipToCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customeCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customeCodeInfo, (value) {
      return _then(_value.copyWith(customeCodeInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.customeCodeInfo,
      required this.salesOrganisation,
      required this.selectedShipToCode});

  @override
  final CustomerCodeInfo customeCodeInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final String selectedShipToCode;

  @override
  String toString() {
    return 'PaymentCustomerInformationEvent.fetch(customeCodeInfo: $customeCodeInfo, salesOrganisation: $salesOrganisation, selectedShipToCode: $selectedShipToCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.customeCodeInfo, customeCodeInfo) ||
                other.customeCodeInfo == customeCodeInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.selectedShipToCode, selectedShipToCode) ||
                other.selectedShipToCode == selectedShipToCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, customeCodeInfo, salesOrganisation, selectedShipToCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customeCodeInfo,
            SalesOrganisation salesOrganisation, String selectedShipToCode)
        fetch,
  }) {
    return fetch(customeCodeInfo, salesOrganisation, selectedShipToCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customeCodeInfo,
            SalesOrganisation salesOrganisation, String selectedShipToCode)?
        fetch,
  }) {
    return fetch?.call(customeCodeInfo, salesOrganisation, selectedShipToCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customeCodeInfo,
            SalesOrganisation salesOrganisation, String selectedShipToCode)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(customeCodeInfo, salesOrganisation, selectedShipToCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PaymentCustomerInformationEvent {
  const factory _Fetch(
      {required final CustomerCodeInfo customeCodeInfo,
      required final SalesOrganisation salesOrganisation,
      required final String selectedShipToCode}) = _$_Fetch;

  CustomerCodeInfo get customeCodeInfo;
  SalesOrganisation get salesOrganisation;
  String get selectedShipToCode;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentCustomerInformationState {
  PaymentCustomerInformation get paymentCustomerInformation =>
      throw _privateConstructorUsedError;
  List<LicenseInfo> get licenses => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>>
      get paymentCustomerInformationFailureOrSuccessOption =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentCustomerInformationStateCopyWith<PaymentCustomerInformationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCustomerInformationStateCopyWith<$Res> {
  factory $PaymentCustomerInformationStateCopyWith(
          PaymentCustomerInformationState value,
          $Res Function(PaymentCustomerInformationState) then) =
      _$PaymentCustomerInformationStateCopyWithImpl<$Res,
          PaymentCustomerInformationState>;
  @useResult
  $Res call(
      {PaymentCustomerInformation paymentCustomerInformation,
      List<LicenseInfo> licenses,
      Option<Either<ApiFailure, dynamic>>
          paymentCustomerInformationFailureOrSuccessOption});

  $PaymentCustomerInformationCopyWith<$Res> get paymentCustomerInformation;
}

/// @nodoc
class _$PaymentCustomerInformationStateCopyWithImpl<$Res,
        $Val extends PaymentCustomerInformationState>
    implements $PaymentCustomerInformationStateCopyWith<$Res> {
  _$PaymentCustomerInformationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentCustomerInformation = null,
    Object? licenses = null,
    Object? paymentCustomerInformationFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      paymentCustomerInformation: null == paymentCustomerInformation
          ? _value.paymentCustomerInformation
          : paymentCustomerInformation // ignore: cast_nullable_to_non_nullable
              as PaymentCustomerInformation,
      licenses: null == licenses
          ? _value.licenses
          : licenses // ignore: cast_nullable_to_non_nullable
              as List<LicenseInfo>,
      paymentCustomerInformationFailureOrSuccessOption: null ==
              paymentCustomerInformationFailureOrSuccessOption
          ? _value.paymentCustomerInformationFailureOrSuccessOption
          : paymentCustomerInformationFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentCustomerInformationCopyWith<$Res> get paymentCustomerInformation {
    return $PaymentCustomerInformationCopyWith<$Res>(
        _value.paymentCustomerInformation, (value) {
      return _then(_value.copyWith(paymentCustomerInformation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaymentCustomerInformationStateCopyWith<$Res>
    implements $PaymentCustomerInformationStateCopyWith<$Res> {
  factory _$$_PaymentCustomerInformationStateCopyWith(
          _$_PaymentCustomerInformationState value,
          $Res Function(_$_PaymentCustomerInformationState) then) =
      __$$_PaymentCustomerInformationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentCustomerInformation paymentCustomerInformation,
      List<LicenseInfo> licenses,
      Option<Either<ApiFailure, dynamic>>
          paymentCustomerInformationFailureOrSuccessOption});

  @override
  $PaymentCustomerInformationCopyWith<$Res> get paymentCustomerInformation;
}

/// @nodoc
class __$$_PaymentCustomerInformationStateCopyWithImpl<$Res>
    extends _$PaymentCustomerInformationStateCopyWithImpl<$Res,
        _$_PaymentCustomerInformationState>
    implements _$$_PaymentCustomerInformationStateCopyWith<$Res> {
  __$$_PaymentCustomerInformationStateCopyWithImpl(
      _$_PaymentCustomerInformationState _value,
      $Res Function(_$_PaymentCustomerInformationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentCustomerInformation = null,
    Object? licenses = null,
    Object? paymentCustomerInformationFailureOrSuccessOption = null,
  }) {
    return _then(_$_PaymentCustomerInformationState(
      paymentCustomerInformation: null == paymentCustomerInformation
          ? _value.paymentCustomerInformation
          : paymentCustomerInformation // ignore: cast_nullable_to_non_nullable
              as PaymentCustomerInformation,
      licenses: null == licenses
          ? _value._licenses
          : licenses // ignore: cast_nullable_to_non_nullable
              as List<LicenseInfo>,
      paymentCustomerInformationFailureOrSuccessOption: null ==
              paymentCustomerInformationFailureOrSuccessOption
          ? _value.paymentCustomerInformationFailureOrSuccessOption
          : paymentCustomerInformationFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_PaymentCustomerInformationState
    extends _PaymentCustomerInformationState {
  const _$_PaymentCustomerInformationState(
      {required this.paymentCustomerInformation,
      required final List<LicenseInfo> licenses,
      required this.paymentCustomerInformationFailureOrSuccessOption})
      : _licenses = licenses,
        super._();

  @override
  final PaymentCustomerInformation paymentCustomerInformation;
  final List<LicenseInfo> _licenses;
  @override
  List<LicenseInfo> get licenses {
    if (_licenses is EqualUnmodifiableListView) return _licenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_licenses);
  }

  @override
  final Option<Either<ApiFailure, dynamic>>
      paymentCustomerInformationFailureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentCustomerInformationState(paymentCustomerInformation: $paymentCustomerInformation, licenses: $licenses, paymentCustomerInformationFailureOrSuccessOption: $paymentCustomerInformationFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentCustomerInformationState &&
            (identical(other.paymentCustomerInformation,
                    paymentCustomerInformation) ||
                other.paymentCustomerInformation ==
                    paymentCustomerInformation) &&
            const DeepCollectionEquality().equals(other._licenses, _licenses) &&
            (identical(other.paymentCustomerInformationFailureOrSuccessOption,
                    paymentCustomerInformationFailureOrSuccessOption) ||
                other.paymentCustomerInformationFailureOrSuccessOption ==
                    paymentCustomerInformationFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentCustomerInformation,
      const DeepCollectionEquality().hash(_licenses),
      paymentCustomerInformationFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentCustomerInformationStateCopyWith<
          _$_PaymentCustomerInformationState>
      get copyWith => __$$_PaymentCustomerInformationStateCopyWithImpl<
          _$_PaymentCustomerInformationState>(this, _$identity);
}

abstract class _PaymentCustomerInformationState
    extends PaymentCustomerInformationState {
  const factory _PaymentCustomerInformationState(
          {required final PaymentCustomerInformation paymentCustomerInformation,
          required final List<LicenseInfo> licenses,
          required final Option<Either<ApiFailure, dynamic>>
              paymentCustomerInformationFailureOrSuccessOption}) =
      _$_PaymentCustomerInformationState;
  const _PaymentCustomerInformationState._() : super._();

  @override
  PaymentCustomerInformation get paymentCustomerInformation;
  @override
  List<LicenseInfo> get licenses;
  @override
  Option<Either<ApiFailure, dynamic>>
      get paymentCustomerInformationFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentCustomerInformationStateCopyWith<
          _$_PaymentCustomerInformationState>
      get copyWith => throw _privateConstructorUsedError;
}
