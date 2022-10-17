// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_term_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentTermEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation)?
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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
abstract class $PaymentTermEventCopyWith<$Res> {
  factory $PaymentTermEventCopyWith(
          PaymentTermEvent value, $Res Function(PaymentTermEvent) then) =
      _$PaymentTermEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaymentTermEventCopyWithImpl<$Res>
    implements $PaymentTermEventCopyWith<$Res> {
  _$PaymentTermEventCopyWithImpl(this._value, this._then);

  final PaymentTermEvent _value;
  // ignore: unused_field
  final $Res Function(PaymentTermEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$PaymentTermEventCopyWithImpl<$Res>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, (v) => _then(v as _$_Initialized));

  @override
  _$_Initialized get _value => super._value as _$_Initialized;
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'PaymentTermEvent.initialized()';
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
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation)?
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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

abstract class _Initialized implements PaymentTermEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customeCodeInfo,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesRepresentativeInfo salesRepresentativeInfo,
      PaymentCustomerInformation paymentCustomerInformation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customeCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesRepresentativeInfoCopyWith<$Res> get salesRepresentativeInfo;
  $PaymentCustomerInformationCopyWith<$Res> get paymentCustomerInformation;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res> extends _$PaymentTermEventCopyWithImpl<$Res>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, (v) => _then(v as _$_Fetch));

  @override
  _$_Fetch get _value => super._value as _$_Fetch;

  @override
  $Res call({
    Object? salesOrganisation = freezed,
    Object? customeCodeInfo = freezed,
    Object? salesOrganisationConfigs = freezed,
    Object? salesRepresentativeInfo = freezed,
    Object? paymentCustomerInformation = freezed,
  }) {
    return _then(_$_Fetch(
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customeCodeInfo: customeCodeInfo == freezed
          ? _value.customeCodeInfo
          : customeCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisationConfigs: salesOrganisationConfigs == freezed
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesRepresentativeInfo: salesRepresentativeInfo == freezed
          ? _value.salesRepresentativeInfo
          : salesRepresentativeInfo // ignore: cast_nullable_to_non_nullable
              as SalesRepresentativeInfo,
      paymentCustomerInformation: paymentCustomerInformation == freezed
          ? _value.paymentCustomerInformation
          : paymentCustomerInformation // ignore: cast_nullable_to_non_nullable
              as PaymentCustomerInformation,
    ));
  }

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  $CustomerCodeInfoCopyWith<$Res> get customeCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customeCodeInfo, (value) {
      return _then(_value.copyWith(customeCodeInfo: value));
    });
  }

  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
    });
  }

  @override
  $SalesRepresentativeInfoCopyWith<$Res> get salesRepresentativeInfo {
    return $SalesRepresentativeInfoCopyWith<$Res>(
        _value.salesRepresentativeInfo, (value) {
      return _then(_value.copyWith(salesRepresentativeInfo: value));
    });
  }

  @override
  $PaymentCustomerInformationCopyWith<$Res> get paymentCustomerInformation {
    return $PaymentCustomerInformationCopyWith<$Res>(
        _value.paymentCustomerInformation, (value) {
      return _then(_value.copyWith(paymentCustomerInformation: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.salesOrganisation,
      required this.customeCodeInfo,
      required this.salesOrganisationConfigs,
      required this.salesRepresentativeInfo,
      required this.paymentCustomerInformation});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customeCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesRepresentativeInfo salesRepresentativeInfo;
  @override
  final PaymentCustomerInformation paymentCustomerInformation;

  @override
  String toString() {
    return 'PaymentTermEvent.fetch(salesOrganisation: $salesOrganisation, customeCodeInfo: $customeCodeInfo, salesOrganisationConfigs: $salesOrganisationConfigs, salesRepresentativeInfo: $salesRepresentativeInfo, paymentCustomerInformation: $paymentCustomerInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality()
                .equals(other.salesOrganisation, salesOrganisation) &&
            const DeepCollectionEquality()
                .equals(other.customeCodeInfo, customeCodeInfo) &&
            const DeepCollectionEquality().equals(
                other.salesOrganisationConfigs, salesOrganisationConfigs) &&
            const DeepCollectionEquality().equals(
                other.salesRepresentativeInfo, salesRepresentativeInfo) &&
            const DeepCollectionEquality().equals(
                other.paymentCustomerInformation, paymentCustomerInformation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(salesOrganisation),
      const DeepCollectionEquality().hash(customeCodeInfo),
      const DeepCollectionEquality().hash(salesOrganisationConfigs),
      const DeepCollectionEquality().hash(salesRepresentativeInfo),
      const DeepCollectionEquality().hash(paymentCustomerInformation));

  @JsonKey(ignore: true)
  @override
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation)
        fetch,
  }) {
    return fetch(salesOrganisation, customeCodeInfo, salesOrganisationConfigs,
        salesRepresentativeInfo, paymentCustomerInformation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation)?
        fetch,
  }) {
    return fetch?.call(
        salesOrganisation,
        customeCodeInfo,
        salesOrganisationConfigs,
        salesRepresentativeInfo,
        paymentCustomerInformation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, customeCodeInfo, salesOrganisationConfigs,
          salesRepresentativeInfo, paymentCustomerInformation);
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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

abstract class _Fetch implements PaymentTermEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customeCodeInfo,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesRepresentativeInfo salesRepresentativeInfo,
      required final PaymentCustomerInformation
          paymentCustomerInformation}) = _$_Fetch;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customeCodeInfo;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesRepresentativeInfo get salesRepresentativeInfo;
  PaymentCustomerInformation get paymentCustomerInformation;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentTermState {
  List<PaymentTerm> get paymentTerms => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get paymentTermsFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentTermStateCopyWith<PaymentTermState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTermStateCopyWith<$Res> {
  factory $PaymentTermStateCopyWith(
          PaymentTermState value, $Res Function(PaymentTermState) then) =
      _$PaymentTermStateCopyWithImpl<$Res>;
  $Res call(
      {List<PaymentTerm> paymentTerms,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> paymentTermsFailureOrSuccessOption});
}

/// @nodoc
class _$PaymentTermStateCopyWithImpl<$Res>
    implements $PaymentTermStateCopyWith<$Res> {
  _$PaymentTermStateCopyWithImpl(this._value, this._then);

  final PaymentTermState _value;
  // ignore: unused_field
  final $Res Function(PaymentTermState) _then;

  @override
  $Res call({
    Object? paymentTerms = freezed,
    Object? isFetching = freezed,
    Object? paymentTermsFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      paymentTerms: paymentTerms == freezed
          ? _value.paymentTerms
          : paymentTerms // ignore: cast_nullable_to_non_nullable
              as List<PaymentTerm>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentTermsFailureOrSuccessOption: paymentTermsFailureOrSuccessOption ==
              freezed
          ? _value.paymentTermsFailureOrSuccessOption
          : paymentTermsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentTermStateCopyWith<$Res>
    implements $PaymentTermStateCopyWith<$Res> {
  factory _$$_PaymentTermStateCopyWith(
          _$_PaymentTermState value, $Res Function(_$_PaymentTermState) then) =
      __$$_PaymentTermStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<PaymentTerm> paymentTerms,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> paymentTermsFailureOrSuccessOption});
}

/// @nodoc
class __$$_PaymentTermStateCopyWithImpl<$Res>
    extends _$PaymentTermStateCopyWithImpl<$Res>
    implements _$$_PaymentTermStateCopyWith<$Res> {
  __$$_PaymentTermStateCopyWithImpl(
      _$_PaymentTermState _value, $Res Function(_$_PaymentTermState) _then)
      : super(_value, (v) => _then(v as _$_PaymentTermState));

  @override
  _$_PaymentTermState get _value => super._value as _$_PaymentTermState;

  @override
  $Res call({
    Object? paymentTerms = freezed,
    Object? isFetching = freezed,
    Object? paymentTermsFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_PaymentTermState(
      paymentTerms: paymentTerms == freezed
          ? _value._paymentTerms
          : paymentTerms // ignore: cast_nullable_to_non_nullable
              as List<PaymentTerm>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentTermsFailureOrSuccessOption: paymentTermsFailureOrSuccessOption ==
              freezed
          ? _value.paymentTermsFailureOrSuccessOption
          : paymentTermsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_PaymentTermState implements _PaymentTermState {
  const _$_PaymentTermState(
      {required final List<PaymentTerm> paymentTerms,
      required this.isFetching,
      required this.paymentTermsFailureOrSuccessOption})
      : _paymentTerms = paymentTerms;

  final List<PaymentTerm> _paymentTerms;
  @override
  List<PaymentTerm> get paymentTerms {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentTerms);
  }

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> paymentTermsFailureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentTermState(paymentTerms: $paymentTerms, isFetching: $isFetching, paymentTermsFailureOrSuccessOption: $paymentTermsFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentTermState &&
            const DeepCollectionEquality()
                .equals(other._paymentTerms, _paymentTerms) &&
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching) &&
            const DeepCollectionEquality().equals(
                other.paymentTermsFailureOrSuccessOption,
                paymentTermsFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_paymentTerms),
      const DeepCollectionEquality().hash(isFetching),
      const DeepCollectionEquality().hash(paymentTermsFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentTermStateCopyWith<_$_PaymentTermState> get copyWith =>
      __$$_PaymentTermStateCopyWithImpl<_$_PaymentTermState>(this, _$identity);
}

abstract class _PaymentTermState implements PaymentTermState {
  const factory _PaymentTermState(
      {required final List<PaymentTerm> paymentTerms,
      required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>>
          paymentTermsFailureOrSuccessOption}) = _$_PaymentTermState;

  @override
  List<PaymentTerm> get paymentTerms;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get paymentTermsFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentTermStateCopyWith<_$_PaymentTermState> get copyWith =>
      throw _privateConstructorUsedError;
}
