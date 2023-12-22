import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'deposit_card_model.dart';
export 'deposit_card_model.dart';

class DepositCardWidget extends StatefulWidget {
  const DepositCardWidget({
    super.key,
    this.logo,
    this.type,
    this.loginSid,
    required this.paymentSystem,
    this.amount,
  });

  final String? logo;
  final String? type;
  final String? loginSid;
  final int? paymentSystem;
  final int? amount;

  @override
  _DepositCardWidgetState createState() => _DepositCardWidgetState();
}

class _DepositCardWidgetState extends State<DepositCardWidget>
    with TickerProviderStateMixin {
  late DepositCardModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        SaturateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DepositCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 370.0,
        height: 230.0,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 6.0,
              color: Color(0x4B1A1F24),
              offset: Offset(0.0, 2.0),
            )
          ],
          gradient: const LinearGradient(
            colors: [Color(0xFFEE8B60), Color(0xFF4B39EF)],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.94, -1.0),
            end: AlignmentDirectional(-0.94, 1.0),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://myaccount.opofinance.com/${widget.logo}',
                width: 44.0,
                height: 44.0,
                fit: BoxFit.cover,
              ),
              Text(
                widget.type!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                '\$1',
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Processing Time ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto Mono',
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      'Instant',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto Mono',
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.apiResultDepositFlow =
                        await _model.depositFlow(context);
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          content:
                              Text(_model.apiResultDepositFlow!.toString()),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );

                    setState(() {});
                  },
                  text: 'Deposit',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0x00FFFFFF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).tertiary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
