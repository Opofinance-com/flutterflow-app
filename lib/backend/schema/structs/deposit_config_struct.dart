// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepositConfigStruct extends BaseStruct {
  DepositConfigStruct({
    int? id,
    String? displayName,
    String? logo,
    String? description,
    String? currencies,
    String? paymentDetailsConfigId,
  })  : _id = id,
        _displayName = displayName,
        _logo = logo,
        _description = description,
        _currencies = currencies,
        _paymentDetailsConfigId = paymentDetailsConfigId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;
  bool hasDisplayName() => _displayName != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;
  bool hasLogo() => _logo != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "currencies" field.
  String? _currencies;
  String get currencies => _currencies ?? '';
  set currencies(String? val) => _currencies = val;
  bool hasCurrencies() => _currencies != null;

  // "paymentDetailsConfigId" field.
  String? _paymentDetailsConfigId;
  String get paymentDetailsConfigId => _paymentDetailsConfigId ?? '';
  set paymentDetailsConfigId(String? val) => _paymentDetailsConfigId = val;
  bool hasPaymentDetailsConfigId() => _paymentDetailsConfigId != null;

  static DepositConfigStruct fromMap(Map<String, dynamic> data) =>
      DepositConfigStruct(
        id: castToType<int>(data['id']),
        displayName: data['displayName'] as String?,
        logo: data['logo'] as String?,
        description: data['description'] as String?,
        currencies: data['currencies'] as String?,
        paymentDetailsConfigId: data['paymentDetailsConfigId'] as String?,
      );

  static DepositConfigStruct? maybeFromMap(dynamic data) => data is Map
      ? DepositConfigStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'displayName': _displayName,
        'logo': _logo,
        'description': _description,
        'currencies': _currencies,
        'paymentDetailsConfigId': _paymentDetailsConfigId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'displayName': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'currencies': serializeParam(
          _currencies,
          ParamType.String,
        ),
        'paymentDetailsConfigId': serializeParam(
          _paymentDetailsConfigId,
          ParamType.String,
        ),
      }.withoutNulls;

  static DepositConfigStruct fromSerializableMap(Map<String, dynamic> data) =>
      DepositConfigStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        displayName: deserializeParam(
          data['displayName'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        currencies: deserializeParam(
          data['currencies'],
          ParamType.String,
          false,
        ),
        paymentDetailsConfigId: deserializeParam(
          data['paymentDetailsConfigId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DepositConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DepositConfigStruct &&
        id == other.id &&
        displayName == other.displayName &&
        logo == other.logo &&
        description == other.description &&
        currencies == other.currencies &&
        paymentDetailsConfigId == other.paymentDetailsConfigId;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, displayName, logo, description, currencies, paymentDetailsConfigId]);
}

DepositConfigStruct createDepositConfigStruct({
  int? id,
  String? displayName,
  String? logo,
  String? description,
  String? currencies,
  String? paymentDetailsConfigId,
}) =>
    DepositConfigStruct(
      id: id,
      displayName: displayName,
      logo: logo,
      description: description,
      currencies: currencies,
      paymentDetailsConfigId: paymentDetailsConfigId,
    );
