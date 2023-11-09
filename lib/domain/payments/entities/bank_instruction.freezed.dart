// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_instruction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BankInstruction {
  String get bank => throw _privateConstructorUsedError;
  List<TransferMethod> get transferMethods =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankInstructionCopyWith<BankInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankInstructionCopyWith<$Res> {
  factory $BankInstructionCopyWith(
          BankInstruction value, $Res Function(BankInstruction) then) =
      _$BankInstructionCopyWithImpl<$Res, BankInstruction>;
  @useResult
  $Res call({String bank, List<TransferMethod> transferMethods});
}

/// @nodoc
class _$BankInstructionCopyWithImpl<$Res, $Val extends BankInstruction>
    implements $BankInstructionCopyWith<$Res> {
  _$BankInstructionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = null,
    Object? transferMethods = null,
  }) {
    return _then(_value.copyWith(
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      transferMethods: null == transferMethods
          ? _value.transferMethods
          : transferMethods // ignore: cast_nullable_to_non_nullable
              as List<TransferMethod>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankInstructionCopyWith<$Res>
    implements $BankInstructionCopyWith<$Res> {
  factory _$$_BankInstructionCopyWith(
          _$_BankInstruction value, $Res Function(_$_BankInstruction) then) =
      __$$_BankInstructionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bank, List<TransferMethod> transferMethods});
}

/// @nodoc
class __$$_BankInstructionCopyWithImpl<$Res>
    extends _$BankInstructionCopyWithImpl<$Res, _$_BankInstruction>
    implements _$$_BankInstructionCopyWith<$Res> {
  __$$_BankInstructionCopyWithImpl(
      _$_BankInstruction _value, $Res Function(_$_BankInstruction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = null,
    Object? transferMethods = null,
  }) {
    return _then(_$_BankInstruction(
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      transferMethods: null == transferMethods
          ? _value._transferMethods
          : transferMethods // ignore: cast_nullable_to_non_nullable
              as List<TransferMethod>,
    ));
  }
}

/// @nodoc

class _$_BankInstruction extends _BankInstruction {
  const _$_BankInstruction(
      {required this.bank, required final List<TransferMethod> transferMethods})
      : _transferMethods = transferMethods,
        super._();

  @override
  final String bank;
  final List<TransferMethod> _transferMethods;
  @override
  List<TransferMethod> get transferMethods {
    if (_transferMethods is EqualUnmodifiableListView) return _transferMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transferMethods);
  }

  @override
  String toString() {
    return 'BankInstruction(bank: $bank, transferMethods: $transferMethods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankInstruction &&
            (identical(other.bank, bank) || other.bank == bank) &&
            const DeepCollectionEquality()
                .equals(other._transferMethods, _transferMethods));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bank, const DeepCollectionEquality().hash(_transferMethods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankInstructionCopyWith<_$_BankInstruction> get copyWith =>
      __$$_BankInstructionCopyWithImpl<_$_BankInstruction>(this, _$identity);
}

abstract class _BankInstruction extends BankInstruction {
  const factory _BankInstruction(
          {required final String bank,
          required final List<TransferMethod> transferMethods}) =
      _$_BankInstruction;
  const _BankInstruction._() : super._();

  @override
  String get bank;
  @override
  List<TransferMethod> get transferMethods;
  @override
  @JsonKey(ignore: true)
  _$$_BankInstructionCopyWith<_$_BankInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransferMethod {
  String get title => throw _privateConstructorUsedError;
  List<InstructionDetail> get paymentInstructions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransferMethodCopyWith<TransferMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferMethodCopyWith<$Res> {
  factory $TransferMethodCopyWith(
          TransferMethod value, $Res Function(TransferMethod) then) =
      _$TransferMethodCopyWithImpl<$Res, TransferMethod>;
  @useResult
  $Res call({String title, List<InstructionDetail> paymentInstructions});
}

/// @nodoc
class _$TransferMethodCopyWithImpl<$Res, $Val extends TransferMethod>
    implements $TransferMethodCopyWith<$Res> {
  _$TransferMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? paymentInstructions = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      paymentInstructions: null == paymentInstructions
          ? _value.paymentInstructions
          : paymentInstructions // ignore: cast_nullable_to_non_nullable
              as List<InstructionDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransferMethodCopyWith<$Res>
    implements $TransferMethodCopyWith<$Res> {
  factory _$$_TransferMethodCopyWith(
          _$_TransferMethod value, $Res Function(_$_TransferMethod) then) =
      __$$_TransferMethodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<InstructionDetail> paymentInstructions});
}

/// @nodoc
class __$$_TransferMethodCopyWithImpl<$Res>
    extends _$TransferMethodCopyWithImpl<$Res, _$_TransferMethod>
    implements _$$_TransferMethodCopyWith<$Res> {
  __$$_TransferMethodCopyWithImpl(
      _$_TransferMethod _value, $Res Function(_$_TransferMethod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? paymentInstructions = null,
  }) {
    return _then(_$_TransferMethod(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      paymentInstructions: null == paymentInstructions
          ? _value._paymentInstructions
          : paymentInstructions // ignore: cast_nullable_to_non_nullable
              as List<InstructionDetail>,
    ));
  }
}

/// @nodoc

class _$_TransferMethod extends _TransferMethod {
  const _$_TransferMethod(
      {required this.title,
      required final List<InstructionDetail> paymentInstructions})
      : _paymentInstructions = paymentInstructions,
        super._();

  @override
  final String title;
  final List<InstructionDetail> _paymentInstructions;
  @override
  List<InstructionDetail> get paymentInstructions {
    if (_paymentInstructions is EqualUnmodifiableListView)
      return _paymentInstructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentInstructions);
  }

  @override
  String toString() {
    return 'TransferMethod(title: $title, paymentInstructions: $paymentInstructions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransferMethod &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._paymentInstructions, _paymentInstructions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title,
      const DeepCollectionEquality().hash(_paymentInstructions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransferMethodCopyWith<_$_TransferMethod> get copyWith =>
      __$$_TransferMethodCopyWithImpl<_$_TransferMethod>(this, _$identity);
}

abstract class _TransferMethod extends TransferMethod {
  const factory _TransferMethod(
          {required final String title,
          required final List<InstructionDetail> paymentInstructions}) =
      _$_TransferMethod;
  const _TransferMethod._() : super._();

  @override
  String get title;
  @override
  List<InstructionDetail> get paymentInstructions;
  @override
  @JsonKey(ignore: true)
  _$$_TransferMethodCopyWith<_$_TransferMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InstructionDetail {
  String get instructionType => throw _privateConstructorUsedError;
  List<String> get instructions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstructionDetailCopyWith<InstructionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionDetailCopyWith<$Res> {
  factory $InstructionDetailCopyWith(
          InstructionDetail value, $Res Function(InstructionDetail) then) =
      _$InstructionDetailCopyWithImpl<$Res, InstructionDetail>;
  @useResult
  $Res call({String instructionType, List<String> instructions});
}

/// @nodoc
class _$InstructionDetailCopyWithImpl<$Res, $Val extends InstructionDetail>
    implements $InstructionDetailCopyWith<$Res> {
  _$InstructionDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instructionType = null,
    Object? instructions = null,
  }) {
    return _then(_value.copyWith(
      instructionType: null == instructionType
          ? _value.instructionType
          : instructionType // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InstructionDetailCopyWith<$Res>
    implements $InstructionDetailCopyWith<$Res> {
  factory _$$_InstructionDetailCopyWith(_$_InstructionDetail value,
          $Res Function(_$_InstructionDetail) then) =
      __$$_InstructionDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String instructionType, List<String> instructions});
}

/// @nodoc
class __$$_InstructionDetailCopyWithImpl<$Res>
    extends _$InstructionDetailCopyWithImpl<$Res, _$_InstructionDetail>
    implements _$$_InstructionDetailCopyWith<$Res> {
  __$$_InstructionDetailCopyWithImpl(
      _$_InstructionDetail _value, $Res Function(_$_InstructionDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instructionType = null,
    Object? instructions = null,
  }) {
    return _then(_$_InstructionDetail(
      instructionType: null == instructionType
          ? _value.instructionType
          : instructionType // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value._instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_InstructionDetail extends _InstructionDetail {
  const _$_InstructionDetail(
      {required this.instructionType, required final List<String> instructions})
      : _instructions = instructions,
        super._();

  @override
  final String instructionType;
  final List<String> _instructions;
  @override
  List<String> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  @override
  String toString() {
    return 'InstructionDetail(instructionType: $instructionType, instructions: $instructions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InstructionDetail &&
            (identical(other.instructionType, instructionType) ||
                other.instructionType == instructionType) &&
            const DeepCollectionEquality()
                .equals(other._instructions, _instructions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, instructionType,
      const DeepCollectionEquality().hash(_instructions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InstructionDetailCopyWith<_$_InstructionDetail> get copyWith =>
      __$$_InstructionDetailCopyWithImpl<_$_InstructionDetail>(
          this, _$identity);
}

abstract class _InstructionDetail extends InstructionDetail {
  const factory _InstructionDetail(
      {required final String instructionType,
      required final List<String> instructions}) = _$_InstructionDetail;
  const _InstructionDetail._() : super._();

  @override
  String get instructionType;
  @override
  List<String> get instructions;
  @override
  @JsonKey(ignore: true)
  _$$_InstructionDetailCopyWith<_$_InstructionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
