// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepositConfigDescriptionStruct extends BaseStruct {
  DepositConfigDescriptionStruct({
    int? min,
    int? max,
  })  : _min = min,
        _max = max;

  // "min" field.
  int? _min;
  int get min => _min ?? 0;
  set min(int? val) => _min = val;
  void incrementMin(int amount) => _min = min + amount;
  bool hasMin() => _min != null;

  // "max" field.
  int? _max;
  int get max => _max ?? 0;
  set max(int? val) => _max = val;
  void incrementMax(int amount) => _max = max + amount;
  bool hasMax() => _max != null;

  static DepositConfigDescriptionStruct fromMap(Map<String, dynamic> data) =>
      DepositConfigDescriptionStruct(
        min: castToType<int>(data['min']),
        max: castToType<int>(data['max']),
      );

  static DepositConfigDescriptionStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? DepositConfigDescriptionStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'min': _min,
        'max': _max,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'min': serializeParam(
          _min,
          ParamType.int,
        ),
        'max': serializeParam(
          _max,
          ParamType.int,
        ),
      }.withoutNulls;

  static DepositConfigDescriptionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DepositConfigDescriptionStruct(
        min: deserializeParam(
          data['min'],
          ParamType.int,
          false,
        ),
        max: deserializeParam(
          data['max'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DepositConfigDescriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DepositConfigDescriptionStruct &&
        min == other.min &&
        max == other.max;
  }

  @override
  int get hashCode => const ListEquality().hash([min, max]);
}

DepositConfigDescriptionStruct createDepositConfigDescriptionStruct({
  int? min,
  int? max,
}) =>
    DepositConfigDescriptionStruct(
      min: min,
      max: max,
    );
