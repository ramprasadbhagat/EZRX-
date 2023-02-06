// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_information_sales_doc_credit_notes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreditNotes {
  String get creditNoteId => throw _privateConstructorUsedError;
  List<Materials> get materials => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditNotesCopyWith<CreditNotes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditNotesCopyWith<$Res> {
  factory $CreditNotesCopyWith(
          CreditNotes value, $Res Function(CreditNotes) then) =
      _$CreditNotesCopyWithImpl<$Res, CreditNotes>;
  @useResult
  $Res call({String creditNoteId, List<Materials> materials});
}

/// @nodoc
class _$CreditNotesCopyWithImpl<$Res, $Val extends CreditNotes>
    implements $CreditNotesCopyWith<$Res> {
  _$CreditNotesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditNoteId = null,
    Object? materials = null,
  }) {
    return _then(_value.copyWith(
      creditNoteId: null == creditNoteId
          ? _value.creditNoteId
          : creditNoteId // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<Materials>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreditNotesCopyWith<$Res>
    implements $CreditNotesCopyWith<$Res> {
  factory _$$_CreditNotesCopyWith(
          _$_CreditNotes value, $Res Function(_$_CreditNotes) then) =
      __$$_CreditNotesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String creditNoteId, List<Materials> materials});
}

/// @nodoc
class __$$_CreditNotesCopyWithImpl<$Res>
    extends _$CreditNotesCopyWithImpl<$Res, _$_CreditNotes>
    implements _$$_CreditNotesCopyWith<$Res> {
  __$$_CreditNotesCopyWithImpl(
      _$_CreditNotes _value, $Res Function(_$_CreditNotes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditNoteId = null,
    Object? materials = null,
  }) {
    return _then(_$_CreditNotes(
      creditNoteId: null == creditNoteId
          ? _value.creditNoteId
          : creditNoteId // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<Materials>,
    ));
  }
}

/// @nodoc

class _$_CreditNotes extends _CreditNotes {
  const _$_CreditNotes(
      {required this.creditNoteId, required final List<Materials> materials})
      : _materials = materials,
        super._();

  @override
  final String creditNoteId;
  final List<Materials> _materials;
  @override
  List<Materials> get materials {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'CreditNotes(creditNoteId: $creditNoteId, materials: $materials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreditNotes &&
            (identical(other.creditNoteId, creditNoteId) ||
                other.creditNoteId == creditNoteId) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode => Object.hash(runtimeType, creditNoteId,
      const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreditNotesCopyWith<_$_CreditNotes> get copyWith =>
      __$$_CreditNotesCopyWithImpl<_$_CreditNotes>(this, _$identity);
}

abstract class _CreditNotes extends CreditNotes {
  const factory _CreditNotes(
      {required final String creditNoteId,
      required final List<Materials> materials}) = _$_CreditNotes;
  const _CreditNotes._() : super._();

  @override
  String get creditNoteId;
  @override
  List<Materials> get materials;
  @override
  @JsonKey(ignore: true)
  _$$_CreditNotesCopyWith<_$_CreditNotes> get copyWith =>
      throw _privateConstructorUsedError;
}
