import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'deposit_model.dart';
export 'deposit_model.dart';

class DepositWidget extends StatefulWidget {
  const DepositWidget({super.key});

  @override
  _DepositWidgetState createState() => _DepositWidgetState();
}

class _DepositWidgetState extends State<DepositWidget>
    with TickerProviderStateMixin {
  late DepositModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
  void initState() {
    super.initState();
    _model = createModel(context, () => DepositModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultAccounts = await RestAPIGroup.walletAccountsCall.call(
        authToken: currentAuthenticationToken,
      );
      if ((_model.apiResultAccounts?.succeeded ?? true)) {
        _model.apiResultWalletAccounts =
            await RestAPIGroup.depositConfigsCall.call(
          authToken: currentAuthenticationToken,
          loginSid: RestAPIGroup.walletAccountsCall
              .loginSid(
                (_model.apiResultAccounts?.jsonBody ?? ''),
              )
              .toString()
              .toString(),
        );
        if ((_model.apiResultWalletAccounts?.succeeded ?? true)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'update',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          setState(() {
            _model.depositConfigsJson = getJsonField(
              (_model.apiResultWalletAccounts?.jsonBody ?? ''),
              r'''$[*]''',
              true,
            )!
                .toList()
                .cast<dynamic>();
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'done',
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
                  (_model.apiResultWalletAccounts?.jsonBody ?? ''),
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
              (_model.apiResultAccounts?.jsonBody ?? '').toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            context.goNamedAuth('auth_3_Login', context.mounted);
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.logout_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
                    child: Builder(
                      builder: (context) {
                        final depositConfigs =
                            _model.depositConfigsJson.toList();
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: depositConfigs.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                          itemBuilder: (context, depositConfigsIndex) {
                            final depositConfigsItem =
                                depositConfigs[depositConfigsIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 4.0, 4.0, 4.0),
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
                                    colors: [
                                      Color(0xFFEE8B60),
                                      Color(0xFF4B39EF)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.94, -1.0),
                                    end: AlignmentDirectional(-0.94, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/default-project-widgets-xzsp5v/assets/ddr0sc80h0hs/@3xlogoMark_outline.png',
                                        width: 44.0,
                                        height: 44.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        getJsonField(
                                          depositConfigsItem,
                                          r'''$.displayName''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Text(
                                        '\$1',
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Processing Time ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto Mono',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Text(
                                              'Instant',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
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
                                            _model.depositBlockResponse =
                                                await _model.deposit(
                                              context,
                                              amount: 100,
                                              paymentSystem: getJsonField(
                                                depositConfigsItem,
                                                r'''$.id''',
                                              ),
                                            );
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(_model
                                                      .depositBlockResponse!
                                                      .toString()),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
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
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0x00FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
