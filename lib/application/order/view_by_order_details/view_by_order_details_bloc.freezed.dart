// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByOrderDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User user, OrderHistoryDetailsOrderHeader orderHeader)
        fetch,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryDetailsOrderHeader orderHeader)?
        fetch,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryDetailsOrderHeader orderHeader)?
        fetch,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderDetailsEventCopyWith<$Res> {
  factory $ViewByOrderDetailsEventCopyWith(ViewByOrderDetailsEvent value,
          $Res Function(ViewByOrderDetailsEvent) then) =
      _$ViewByOrderDetailsEventCopyWithImpl<$Res, ViewByOrderDetailsEvent>;
}

/// @nodoc
class _$ViewByOrderDetailsEventCopyWithImpl<$Res,
        $Val extends ViewByOrderDetailsEvent>
    implements $ViewByOrderDetailsEventCopyWith<$Res> {
  _$ViewByOrderDetailsEventCopyWithImpl(this._value, this._then);

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
    extends _$ViewByOrderDetailsEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'ViewByOrderDetailsEvent.initialized()';
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
            User user, OrderHistoryDetailsOrderHeader orderHeader)
        fetch,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryDetailsOrderHeader orderHeader)?
        fetch,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryDetailsOrderHeader orderHeader)?
        fetch,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
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
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ViewByOrderDetailsEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({User user, OrderHistoryDetailsOrderHeader orderHeader});

  $UserCopyWith<$Res> get user;
  $OrderHistoryDetailsOrderHeaderCopyWith<$Res> get orderHeader;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ViewByOrderDetailsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? orderHeader = null,
  }) {
    return _then(_$_Fetch(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      orderHeader: null == orderHeader
          ? _value.orderHeader
          : orderHeader // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderHeader,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsOrderHeaderCopyWith<$Res> get orderHeader {
    return $OrderHistoryDetailsOrderHeaderCopyWith<$Res>(_value.orderHeader,
        (value) {
      return _then(_value.copyWith(orderHeader: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.user, required this.orderHeader});

  @override
  final User user;
  @override
  final OrderHistoryDetailsOrderHeader orderHeader;

  @override
  String toString() {
    return 'ViewByOrderDetailsEvent.fetch(user: $user, orderHeader: $orderHeader)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.orderHeader, orderHeader) ||
                other.orderHeader == orderHeader));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, orderHeader);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User user, OrderHistoryDetailsOrderHeader orderHeader)
        fetch,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
  }) {
    return fetch(user, orderHeader);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryDetailsOrderHeader orderHeader)?
        fetch,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
  }) {
    return fetch?.call(user, orderHeader);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryDetailsOrderHeader orderHeader)?
        fetch,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(user, orderHeader);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ViewByOrderDetailsEvent {
  const factory _Fetch(
      {required final User user,
      required final OrderHistoryDetailsOrderHeader orderHeader}) = _$_Fetch;

  User get user;
  OrderHistoryDetailsOrderHeader get orderHeader;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateMaterialTenderContractCopyWith<$Res> {
  factory _$$_UpdateMaterialTenderContractCopyWith(
          _$_UpdateMaterialTenderContract value,
          $Res Function(_$_UpdateMaterialTenderContract) then) =
      __$$_UpdateMaterialTenderContractCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {TenderContract selectedTenderContract, MaterialQueryInfo queryInfo});

  $TenderContractCopyWith<$Res> get selectedTenderContract;
  $MaterialQueryInfoCopyWith<$Res> get queryInfo;
}

/// @nodoc
class __$$_UpdateMaterialTenderContractCopyWithImpl<$Res>
    extends _$ViewByOrderDetailsEventCopyWithImpl<$Res,
        _$_UpdateMaterialTenderContract>
    implements _$$_UpdateMaterialTenderContractCopyWith<$Res> {
  __$$_UpdateMaterialTenderContractCopyWithImpl(
      _$_UpdateMaterialTenderContract _value,
      $Res Function(_$_UpdateMaterialTenderContract) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTenderContract = null,
    Object? queryInfo = null,
  }) {
    return _then(_$_UpdateMaterialTenderContract(
      selectedTenderContract: null == selectedTenderContract
          ? _value.selectedTenderContract
          : selectedTenderContract // ignore: cast_nullable_to_non_nullable
              as TenderContract,
      queryInfo: null == queryInfo
          ? _value.queryInfo
          : queryInfo // ignore: cast_nullable_to_non_nullable
              as MaterialQueryInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TenderContractCopyWith<$Res> get selectedTenderContract {
    return $TenderContractCopyWith<$Res>(_value.selectedTenderContract,
        (value) {
      return _then(_value.copyWith(selectedTenderContract: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialQueryInfoCopyWith<$Res> get queryInfo {
    return $MaterialQueryInfoCopyWith<$Res>(_value.queryInfo, (value) {
      return _then(_value.copyWith(queryInfo: value));
    });
  }
}

/// @nodoc

class _$_UpdateMaterialTenderContract implements _UpdateMaterialTenderContract {
  const _$_UpdateMaterialTenderContract(
      {required this.selectedTenderContract, required this.queryInfo});

  @override
  final TenderContract selectedTenderContract;
  @override
  final MaterialQueryInfo queryInfo;

  @override
  String toString() {
    return 'ViewByOrderDetailsEvent.updateMaterialTenderContract(selectedTenderContract: $selectedTenderContract, queryInfo: $queryInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateMaterialTenderContract &&
            (identical(other.selectedTenderContract, selectedTenderContract) ||
                other.selectedTenderContract == selectedTenderContract) &&
            (identical(other.queryInfo, queryInfo) ||
                other.queryInfo == queryInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedTenderContract, queryInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateMaterialTenderContractCopyWith<_$_UpdateMaterialTenderContract>
      get copyWith => __$$_UpdateMaterialTenderContractCopyWithImpl<
          _$_UpdateMaterialTenderContract>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User user, OrderHistoryDetailsOrderHeader orderHeader)
        fetch,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
  }) {
    return updateMaterialTenderContract(selectedTenderContract, queryInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryDetailsOrderHeader orderHeader)?
        fetch,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
  }) {
    return updateMaterialTenderContract?.call(
        selectedTenderContract, queryInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryDetailsOrderHeader orderHeader)?
        fetch,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    required TResult orElse(),
  }) {
    if (updateMaterialTenderContract != null) {
      return updateMaterialTenderContract(selectedTenderContract, queryInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
  }) {
    return updateMaterialTenderContract(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
  }) {
    return updateMaterialTenderContract?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    required TResult orElse(),
  }) {
    if (updateMaterialTenderContract != null) {
      return updateMaterialTenderContract(this);
    }
    return orElse();
  }
}

abstract class _UpdateMaterialTenderContract
    implements ViewByOrderDetailsEvent {
  const factory _UpdateMaterialTenderContract(
          {required final TenderContract selectedTenderContract,
          required final MaterialQueryInfo queryInfo}) =
      _$_UpdateMaterialTenderContract;

  TenderContract get selectedTenderContract;
  MaterialQueryInfo get queryInfo;
  @JsonKey(ignore: true)
  _$$_UpdateMaterialTenderContractCopyWith<_$_UpdateMaterialTenderContract>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ExpandAttachmentsCopyWith<$Res> {
  factory _$$_ExpandAttachmentsCopyWith(_$_ExpandAttachments value,
          $Res Function(_$_ExpandAttachments) then) =
      __$$_ExpandAttachmentsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ExpandAttachmentsCopyWithImpl<$Res>
    extends _$ViewByOrderDetailsEventCopyWithImpl<$Res, _$_ExpandAttachments>
    implements _$$_ExpandAttachmentsCopyWith<$Res> {
  __$$_ExpandAttachmentsCopyWithImpl(
      _$_ExpandAttachments _value, $Res Function(_$_ExpandAttachments) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ExpandAttachments implements _ExpandAttachments {
  const _$_ExpandAttachments();

  @override
  String toString() {
    return 'ViewByOrderDetailsEvent.expandAttachments()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ExpandAttachments);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User user, OrderHistoryDetailsOrderHeader orderHeader)
        fetch,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
  }) {
    return expandAttachments();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryDetailsOrderHeader orderHeader)?
        fetch,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
  }) {
    return expandAttachments?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryDetailsOrderHeader orderHeader)?
        fetch,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    required TResult orElse(),
  }) {
    if (expandAttachments != null) {
      return expandAttachments();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
  }) {
    return expandAttachments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
  }) {
    return expandAttachments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    required TResult orElse(),
  }) {
    if (expandAttachments != null) {
      return expandAttachments(this);
    }
    return orElse();
  }
}

abstract class _ExpandAttachments implements ViewByOrderDetailsEvent {
  const factory _ExpandAttachments() = _$_ExpandAttachments;
}

/// @nodoc
mixin _$ViewByOrderDetailsState {
  OrderHistoryDetails get orderHistoryDetails =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Map<MaterialQueryInfo, bool> get isLoadingTenderContract =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Map<MaterialQueryInfo, PriceAggregate> get materials =>
      throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrderDetailsStateCopyWith<ViewByOrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderDetailsStateCopyWith<$Res> {
  factory $ViewByOrderDetailsStateCopyWith(ViewByOrderDetailsState value,
          $Res Function(ViewByOrderDetailsState) then) =
      _$ViewByOrderDetailsStateCopyWithImpl<$Res, ViewByOrderDetailsState>;
  @useResult
  $Res call(
      {OrderHistoryDetails orderHistoryDetails,
      bool isLoading,
      Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      Map<MaterialQueryInfo, PriceAggregate> materials,
      bool isExpanded});

  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails;
}

/// @nodoc
class _$ViewByOrderDetailsStateCopyWithImpl<$Res,
        $Val extends ViewByOrderDetailsState>
    implements $ViewByOrderDetailsStateCopyWith<$Res> {
  _$ViewByOrderDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryDetails = null,
    Object? isLoading = null,
    Object? isLoadingTenderContract = null,
    Object? failureOrSuccessOption = null,
    Object? materials = null,
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      orderHistoryDetails: null == orderHistoryDetails
          ? _value.orderHistoryDetails
          : orderHistoryDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetails,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingTenderContract: null == isLoadingTenderContract
          ? _value.isLoadingTenderContract
          : isLoadingTenderContract // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, bool>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, PriceAggregate>,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails {
    return $OrderHistoryDetailsCopyWith<$Res>(_value.orderHistoryDetails,
        (value) {
      return _then(_value.copyWith(orderHistoryDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ViewByOrderDetailsStateCopyWith<$Res>
    implements $ViewByOrderDetailsStateCopyWith<$Res> {
  factory _$$_ViewByOrderDetailsStateCopyWith(_$_ViewByOrderDetailsState value,
          $Res Function(_$_ViewByOrderDetailsState) then) =
      __$$_ViewByOrderDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderHistoryDetails orderHistoryDetails,
      bool isLoading,
      Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      Map<MaterialQueryInfo, PriceAggregate> materials,
      bool isExpanded});

  @override
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails;
}

/// @nodoc
class __$$_ViewByOrderDetailsStateCopyWithImpl<$Res>
    extends _$ViewByOrderDetailsStateCopyWithImpl<$Res,
        _$_ViewByOrderDetailsState>
    implements _$$_ViewByOrderDetailsStateCopyWith<$Res> {
  __$$_ViewByOrderDetailsStateCopyWithImpl(_$_ViewByOrderDetailsState _value,
      $Res Function(_$_ViewByOrderDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryDetails = null,
    Object? isLoading = null,
    Object? isLoadingTenderContract = null,
    Object? failureOrSuccessOption = null,
    Object? materials = null,
    Object? isExpanded = null,
  }) {
    return _then(_$_ViewByOrderDetailsState(
      orderHistoryDetails: null == orderHistoryDetails
          ? _value.orderHistoryDetails
          : orderHistoryDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetails,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingTenderContract: null == isLoadingTenderContract
          ? _value._isLoadingTenderContract
          : isLoadingTenderContract // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, bool>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, PriceAggregate>,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ViewByOrderDetailsState extends _ViewByOrderDetailsState {
  const _$_ViewByOrderDetailsState(
      {required this.orderHistoryDetails,
      required this.isLoading,
      required final Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      required this.failureOrSuccessOption,
      required final Map<MaterialQueryInfo, PriceAggregate> materials,
      required this.isExpanded})
      : _isLoadingTenderContract = isLoadingTenderContract,
        _materials = materials,
        super._();

  @override
  final OrderHistoryDetails orderHistoryDetails;
  @override
  final bool isLoading;
  final Map<MaterialQueryInfo, bool> _isLoadingTenderContract;
  @override
  Map<MaterialQueryInfo, bool> get isLoadingTenderContract {
    if (_isLoadingTenderContract is EqualUnmodifiableMapView)
      return _isLoadingTenderContract;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isLoadingTenderContract);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final Map<MaterialQueryInfo, PriceAggregate> _materials;
  @override
  Map<MaterialQueryInfo, PriceAggregate> get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @override
  final bool isExpanded;

  @override
  String toString() {
    return 'ViewByOrderDetailsState(orderHistoryDetails: $orderHistoryDetails, isLoading: $isLoading, isLoadingTenderContract: $isLoadingTenderContract, failureOrSuccessOption: $failureOrSuccessOption, materials: $materials, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderDetailsState &&
            (identical(other.orderHistoryDetails, orderHistoryDetails) ||
                other.orderHistoryDetails == orderHistoryDetails) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(
                other._isLoadingTenderContract, _isLoadingTenderContract) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderHistoryDetails,
      isLoading,
      const DeepCollectionEquality().hash(_isLoadingTenderContract),
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_materials),
      isExpanded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrderDetailsStateCopyWith<_$_ViewByOrderDetailsState>
      get copyWith =>
          __$$_ViewByOrderDetailsStateCopyWithImpl<_$_ViewByOrderDetailsState>(
              this, _$identity);
}

abstract class _ViewByOrderDetailsState extends ViewByOrderDetailsState {
  const factory _ViewByOrderDetailsState(
      {required final OrderHistoryDetails orderHistoryDetails,
      required final bool isLoading,
      required final Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final Map<MaterialQueryInfo, PriceAggregate> materials,
      required final bool isExpanded}) = _$_ViewByOrderDetailsState;
  const _ViewByOrderDetailsState._() : super._();

  @override
  OrderHistoryDetails get orderHistoryDetails;
  @override
  bool get isLoading;
  @override
  Map<MaterialQueryInfo, bool> get isLoadingTenderContract;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  Map<MaterialQueryInfo, PriceAggregate> get materials;
  @override
  bool get isExpanded;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderDetailsStateCopyWith<_$_ViewByOrderDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
