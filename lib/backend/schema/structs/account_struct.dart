// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountStruct extends BaseStruct {
  AccountStruct({
    String? login,
    int? sid,
    int? typeId,
    String? loginSid,
    String? currency,
    int? levrage,
    double? balance,
    double? equity,
    double? credit,
    double? margin,
  })  : _login = login,
        _sid = sid,
        _typeId = typeId,
        _loginSid = loginSid,
        _currency = currency,
        _levrage = levrage,
        _balance = balance,
        _equity = equity,
        _credit = credit,
        _margin = margin;

  // "login" field.
  String? _login;
  String get login => _login ?? '';
  set login(String? val) => _login = val;
  bool hasLogin() => _login != null;

  // "sid" field.
  int? _sid;
  int get sid => _sid ?? 0;
  set sid(int? val) => _sid = val;
  void incrementSid(int amount) => _sid = sid + amount;
  bool hasSid() => _sid != null;

  // "typeId" field.
  int? _typeId;
  int get typeId => _typeId ?? 0;
  set typeId(int? val) => _typeId = val;
  void incrementTypeId(int amount) => _typeId = typeId + amount;
  bool hasTypeId() => _typeId != null;

  // "loginSid" field.
  String? _loginSid;
  String get loginSid => _loginSid ?? '';
  set loginSid(String? val) => _loginSid = val;
  bool hasLoginSid() => _loginSid != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;
  bool hasCurrency() => _currency != null;

  // "levrage" field.
  int? _levrage;
  int get levrage => _levrage ?? 0;
  set levrage(int? val) => _levrage = val;
  void incrementLevrage(int amount) => _levrage = levrage + amount;
  bool hasLevrage() => _levrage != null;

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  set balance(double? val) => _balance = val;
  void incrementBalance(double amount) => _balance = balance + amount;
  bool hasBalance() => _balance != null;

  // "equity" field.
  double? _equity;
  double get equity => _equity ?? 0.0;
  set equity(double? val) => _equity = val;
  void incrementEquity(double amount) => _equity = equity + amount;
  bool hasEquity() => _equity != null;

  // "credit" field.
  double? _credit;
  double get credit => _credit ?? 0.0;
  set credit(double? val) => _credit = val;
  void incrementCredit(double amount) => _credit = credit + amount;
  bool hasCredit() => _credit != null;

  // "margin" field.
  double? _margin;
  double get margin => _margin ?? 0.0;
  set margin(double? val) => _margin = val;
  void incrementMargin(double amount) => _margin = margin + amount;
  bool hasMargin() => _margin != null;

  static AccountStruct fromMap(Map<String, dynamic> data) => AccountStruct(
        login: data['login'] as String?,
        sid: castToType<int>(data['sid']),
        typeId: castToType<int>(data['typeId']),
        loginSid: data['loginSid'] as String?,
        currency: data['currency'] as String?,
        levrage: castToType<int>(data['levrage']),
        balance: castToType<double>(data['balance']),
        equity: castToType<double>(data['equity']),
        credit: castToType<double>(data['credit']),
        margin: castToType<double>(data['margin']),
      );

  static AccountStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AccountStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'login': _login,
        'sid': _sid,
        'typeId': _typeId,
        'loginSid': _loginSid,
        'currency': _currency,
        'levrage': _levrage,
        'balance': _balance,
        'equity': _equity,
        'credit': _credit,
        'margin': _margin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'login': serializeParam(
          _login,
          ParamType.String,
        ),
        'sid': serializeParam(
          _sid,
          ParamType.int,
        ),
        'typeId': serializeParam(
          _typeId,
          ParamType.int,
        ),
        'loginSid': serializeParam(
          _loginSid,
          ParamType.String,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'levrage': serializeParam(
          _levrage,
          ParamType.int,
        ),
        'balance': serializeParam(
          _balance,
          ParamType.double,
        ),
        'equity': serializeParam(
          _equity,
          ParamType.double,
        ),
        'credit': serializeParam(
          _credit,
          ParamType.double,
        ),
        'margin': serializeParam(
          _margin,
          ParamType.double,
        ),
      }.withoutNulls;

  static AccountStruct fromSerializableMap(Map<String, dynamic> data) =>
      AccountStruct(
        login: deserializeParam(
          data['login'],
          ParamType.String,
          false,
        ),
        sid: deserializeParam(
          data['sid'],
          ParamType.int,
          false,
        ),
        typeId: deserializeParam(
          data['typeId'],
          ParamType.int,
          false,
        ),
        loginSid: deserializeParam(
          data['loginSid'],
          ParamType.String,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        levrage: deserializeParam(
          data['levrage'],
          ParamType.int,
          false,
        ),
        balance: deserializeParam(
          data['balance'],
          ParamType.double,
          false,
        ),
        equity: deserializeParam(
          data['equity'],
          ParamType.double,
          false,
        ),
        credit: deserializeParam(
          data['credit'],
          ParamType.double,
          false,
        ),
        margin: deserializeParam(
          data['margin'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'AccountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AccountStruct &&
        login == other.login &&
        sid == other.sid &&
        typeId == other.typeId &&
        loginSid == other.loginSid &&
        currency == other.currency &&
        levrage == other.levrage &&
        balance == other.balance &&
        equity == other.equity &&
        credit == other.credit &&
        margin == other.margin;
  }

  @override
  int get hashCode => const ListEquality().hash([
        login,
        sid,
        typeId,
        loginSid,
        currency,
        levrage,
        balance,
        equity,
        credit,
        margin
      ]);
}

AccountStruct createAccountStruct({
  String? login,
  int? sid,
  int? typeId,
  String? loginSid,
  String? currency,
  int? levrage,
  double? balance,
  double? equity,
  double? credit,
  double? margin,
}) =>
    AccountStruct(
      login: login,
      sid: sid,
      typeId: typeId,
      loginSid: loginSid,
      currency: currency,
      levrage: levrage,
      balance: balance,
      equity: equity,
      credit: credit,
      margin: margin,
    );
