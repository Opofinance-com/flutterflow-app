import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'deposit_widget.dart' show DepositWidget;
import 'package:flutter/material.dart';

class DepositModel extends FlutterFlowModel<DepositWidget> {
  ///  Local state fields for this page.

  List<DepositConfigStruct> depositList = [];
  void addToDepositList(DepositConfigStruct item) => depositList.add(item);
  void removeFromDepositList(DepositConfigStruct item) =>
      depositList.remove(item);
  void removeAtIndexFromDepositList(int index) => depositList.removeAt(index);
  void insertAtIndexInDepositList(int index, DepositConfigStruct item) =>
      depositList.insert(index, item);
  void updateDepositListAtIndex(
          int index, Function(DepositConfigStruct) updateFn) =>
      depositList[index] = updateFn(depositList[index]);

  List<dynamic> depositConfigsJson = [];
  void addToDepositConfigsJson(dynamic item) => depositConfigsJson.add(item);
  void removeFromDepositConfigsJson(dynamic item) =>
      depositConfigsJson.remove(item);
  void removeAtIndexFromDepositConfigsJson(int index) =>
      depositConfigsJson.removeAt(index);
  void insertAtIndexInDepositConfigsJson(int index, dynamic item) =>
      depositConfigsJson.insert(index, item);
  void updateDepositConfigsJsonAtIndex(int index, Function(dynamic) updateFn) =>
      depositConfigsJson[index] = updateFn(depositConfigsJson[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (WalletAccounts)] action in Deposit widget.
  ApiCallResponse? apiResultAccounts;
  // Stores action output result for [Backend Call - API (Deposit Configs)] action in Deposit widget.
  ApiCallResponse? apiResultWalletAccounts;
  // Stores action output result for [Action Block - Deposit] action in Button widget.
  dynamic depositBlockResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future<dynamic> deposit(
    BuildContext context, {
    int? amount,
    int? paymentSystem,
  }) async {
    ApiCallResponse? depositStepOneResponse;
    ApiCallResponse? depositStepTwoResponse;
    ApiCallResponse? depositStepThreeResponse;

    // DepositStepOne
    depositStepOneResponse = await RestAPIGroup.depositStepOneCall.call(
      authToken: currentAuthenticationToken,
      loginSid: RestAPIGroup.walletAccountsCall
          .loginSid(
            (apiResultAccounts?.jsonBody ?? ''),
          )
          .toString()
          .toString(),
      paymentSystem: paymentSystem,
    );
    if ((depositStepOneResponse.succeeded ?? true)) {
      // DepositStepTwo
      depositStepTwoResponse = await RestAPIGroup.depositStepTwoCall.call(
        authToken: currentAuthenticationToken,
        flowDepositInstance: (RestAPIGroup.depositStepOneCall.values(
          (depositStepOneResponse.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()
            .first
            .toString(),
        amount: amount,
      );
      if ((depositStepTwoResponse.succeeded ?? true)) {
        // DepositStepThree
        depositStepThreeResponse = await RestAPIGroup.depositStepThreeCall.call(
          authToken: currentAuthenticationToken,
          flowDepositInstance: (RestAPIGroup.depositStepTwoCall.values(
            (depositStepTwoResponse.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first,
          depositToken: (RestAPIGroup.depositStepTwoCall.values(
            (depositStepTwoResponse.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .last,
        );
        if ((depositStepThreeResponse.succeeded ?? true)) {
          return (depositStepThreeResponse.jsonBody ?? '');
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (depositStepThreeResponse.jsonBody ?? ''),
                r'''$.message''',
              ).toString().toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (depositStepTwoResponse.jsonBody ?? ''),
                r'''$.message''',
              ).toString().toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            getJsonField(
              (depositStepOneResponse.jsonBody ?? ''),
              r'''$.message''',
            ).toString().toString(),
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    }

    return null;
  }

  /// Additional helper methods are added here.
}
