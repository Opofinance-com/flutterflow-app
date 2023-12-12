import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/deposit_card_widget.dart';
import '/components/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'deposit_model.dart';
export 'deposit_model.dart';

class DepositWidget extends StatefulWidget {
  const DepositWidget({super.key});

  @override
  _DepositWidgetState createState() => _DepositWidgetState();
}

class _DepositWidgetState extends State<DepositWidget> {
  late DepositModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Container(
                    width: 270.0,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: wrapWithModel(
                      model: _model.sideBarModel,
                      updateCallback: () => setState(() {}),
                      child: const SideBarWidget(),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: Builder(
                      builder: (context) {
                        final depositConfigs =
                            _model.depositConfigsJson.toList();
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 1;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 2;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 2;
                              } else {
                                return 3;
                              }
                            }(),
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.4,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: depositConfigs.length,
                          itemBuilder: (context, depositConfigsIndex) {
                            final depositConfigsItem =
                                depositConfigs[depositConfigsIndex];
                            return wrapWithModel(
                              model: _model.depositCardModels.getModel(
                                depositConfigsIndex.toString(),
                                depositConfigsIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              child: DepositCardWidget(
                                key: Key(
                                  'Keyxt9_${depositConfigsIndex.toString()}',
                                ),
                                logo: valueOrDefault<String>(
                                  getJsonField(
                                    depositConfigsItem,
                                    r'''$.logo''',
                                  ).toString(),
                                  '\$.logo',
                                ),
                                type: getJsonField(
                                  depositConfigsItem,
                                  r'''$.displayName''',
                                ).toString(),
                                loginSid: RestAPIGroup.walletAccountsCall
                                    .loginSid(
                                      (_model.apiResultAccounts?.jsonBody ??
                                          ''),
                                    )
                                    .toString(),
                                paymentSystem: getJsonField(
                                  depositConfigsItem,
                                  r'''$.id''',
                                ),
                                amount: 100,
                              ),
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
