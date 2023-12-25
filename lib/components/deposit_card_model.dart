import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'deposit_card_widget.dart' show DepositCardWidget;
import 'package:flutter/material.dart';

class DepositCardModel extends FlutterFlowModel<DepositCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - depositFlow] action in Button widget.
  dynamic apiResultDepositFlow;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  Future<dynamic> depositFlow(BuildContext context) async {
    ApiCallResponse? depositStepOneResponse;
    ApiCallResponse? depositStepTwoResponse;
    ApiCallResponse? depositStepThreeResponse;

    // DepositStepOne
    depositStepOneResponse = await RestAPIGroup.depositStepOneCall.call(
      loginSid: widget.loginSid,
      paymentSystem: widget.paymentSystem,
    );
    if ((depositStepOneResponse.succeeded ?? true)) {
      // DepositStepTwo
      depositStepTwoResponse = await RestAPIGroup.depositStepTwoCall.call(
        flowDepositInstance: (RestAPIGroup.depositStepOneCall.values(
          (depositStepOneResponse.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()
            .first
            .toString(),
        amount: widget.amount,
      );
      if ((depositStepTwoResponse.succeeded ?? true)) {
        // DepositStepThree
        depositStepThreeResponse = await RestAPIGroup.depositStepThreeCall.call(
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
