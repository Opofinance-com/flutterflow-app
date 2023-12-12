import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start RestAPI Group Code

class RestAPIGroup {
  static String baseUrl = 'https://myaccount.opofinance.com/client-api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [authToken]',
  };
  static DepositStepOneCall depositStepOneCall = DepositStepOneCall();
  static DepositStepTwoCall depositStepTwoCall = DepositStepTwoCall();
  static DepositStepThreeCall depositStepThreeCall = DepositStepThreeCall();
  static LoginCall loginCall = LoginCall();
  static WalletAccountsCall walletAccountsCall = WalletAccountsCall();
  static DepositConfigsCall depositConfigsCall = DepositConfigsCall();
}

class DepositStepOneCall {
  Future<ApiCallResponse> call({
    String? loginSid = '',
    int? paymentSystem,
    String? authToken =
        '5942c62bebe30c970c57c02682e9a52f2cf715cf6ecfb327d27708ffde94078fec4ef2202e5b999c8e5269d8ac5f0e1241e81cfee864a1a7b14ef165',
    String? apiVersion = 'version=1.0.0',
  }) async {
    final ffApiRequestBody = '''
{"account":"$loginSid","paymentSystem":$paymentSystem}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DepositStepOne',
      apiUrl: '${RestAPIGroup.baseUrl}/deposit?$apiVersion',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic values(dynamic response) => getJsonField(
        response,
        r'''$.form.fields[:].value''',
        true,
      );
  dynamic names(dynamic response) => getJsonField(
        response,
        r'''$.form.fields''',
        true,
      );
}

class DepositStepTwoCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? flowDepositInstance = '',
    String? customCookie = '',
    String? authToken =
        '5942c62bebe30c970c57c02682e9a52f2cf715cf6ecfb327d27708ffde94078fec4ef2202e5b999c8e5269d8ac5f0e1241e81cfee864a1a7b14ef165',
    String? apiVersion = 'version=1.0.0',
  }) async {
    final ffApiRequestBody = '''
{"form": { "amount":$amount,"flow_deposit_instance":"$flowDepositInstance","flow_deposit_step":2,"calculatedAmount": null,"paymentMethodOption": "USX"}}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DepositStepTwo',
      apiUrl: '${RestAPIGroup.baseUrl}/deposit?$apiVersion',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic values(dynamic response) => getJsonField(
        response,
        r'''$.form.fields[:].value''',
        true,
      );
  dynamic names(dynamic response) => getJsonField(
        response,
        r'''$.form.fields[:].name''',
        true,
      );
  dynamic fields(dynamic response) => getJsonField(
        response,
        r'''$.form.fields''',
        true,
      );
}

class DepositStepThreeCall {
  Future<ApiCallResponse> call({
    String? flowDepositInstance = '',
    String? depositToken = '',
    String? authToken =
        '5942c62bebe30c970c57c02682e9a52f2cf715cf6ecfb327d27708ffde94078fec4ef2202e5b999c8e5269d8ac5f0e1241e81cfee864a1a7b14ef165',
    String? apiVersion = 'version=1.0.0',
  }) async {
    final ffApiRequestBody = '''
{
  "form": {
    "flow_deposit_instance": "$flowDepositInstance",
    "flow_deposit_step": 3,
    "hidden": null,
    "token": "$depositToken"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DepositStepThree',
      apiUrl: '${RestAPIGroup.baseUrl}/deposit?$apiVersion',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    bool? rememberMe,
    String? authToken =
        '5942c62bebe30c970c57c02682e9a52f2cf715cf6ecfb327d27708ffde94078fec4ef2202e5b999c8e5269d8ac5f0e1241e81cfee864a1a7b14ef165',
    String? apiVersion = 'version=1.0.0',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password",
  "rememberMe": $rememberMe
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${RestAPIGroup.baseUrl}/login?$apiVersion',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.accessToken''',
      );
  dynamic expDate(dynamic response) => getJsonField(
        response,
        r'''$.expDate''',
      );
  dynamic clientId(dynamic response) => getJsonField(
        response,
        r'''$.client.id''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.client.phone''',
      );
  dynamic exp(dynamic response) => getJsonField(
        response,
        r'''$.exp''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.client.firstName''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.client.lastName''',
      );
}

class WalletAccountsCall {
  Future<ApiCallResponse> call({
    String? authToken =
        '5942c62bebe30c970c57c02682e9a52f2cf715cf6ecfb327d27708ffde94078fec4ef2202e5b999c8e5269d8ac5f0e1241e81cfee864a1a7b14ef165',
    String? apiVersion = 'version=1.0.0',
  }) async {
    const ffApiRequestBody = '''
{
  "scope": "deposit"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'WalletAccounts',
      apiUrl: '${RestAPIGroup.baseUrl}/accounts?$apiVersion',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic loginSid(dynamic response) => getJsonField(
        response,
        r'''$[:].loginSid''',
      );
}

class DepositConfigsCall {
  Future<ApiCallResponse> call({
    String? loginSid = '0',
    String? authToken =
        '5942c62bebe30c970c57c02682e9a52f2cf715cf6ecfb327d27708ffde94078fec4ef2202e5b999c8e5269d8ac5f0e1241e81cfee864a1a7b14ef165',
    String? apiVersion = 'version=1.0.0',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Deposit Configs',
      apiUrl:
          '${RestAPIGroup.baseUrl}/payment-systems/deposit/$loginSid?$apiVersion',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic logo(dynamic response) => getJsonField(
        response,
        r'''$[:].logo''',
        true,
      );
  dynamic displayName(dynamic response) => getJsonField(
        response,
        r'''$[:].displayName''',
        true,
      );
  dynamic displayOrder(dynamic response) => getJsonField(
        response,
        r'''$[:].displayOrder''',
        true,
      );
  dynamic paymentDetailsRequired(dynamic response) => getJsonField(
        response,
        r'''$[:].paymentDetailsRequired''',
        true,
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$[:].description''',
        true,
      );
  dynamic currencies(dynamic response) => getJsonField(
        response,
        r'''$[:].currencies''',
        true,
      );
  dynamic paymentDetailsConfigId(dynamic response) => getJsonField(
        response,
        r'''$[:].paymentDetailsConfigId''',
        true,
      );
}

/// End RestAPI Group Code

/// Start ClientAPI Group Code

class ClientAPIGroup {
  static String baseUrl = 'https://myaccount.opofinance.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [authToken]',
  };
  static PayoutCall payoutCall = PayoutCall();
  static TypesCall typesCall = TypesCall();
  static AccountsCall accountsCall = AccountsCall();
  static NewAccountCall newAccountCall = NewAccountCall();
  static ChangePasswordAccountCall changePasswordAccountCall =
      ChangePasswordAccountCall();
  static ChangelEverageCall changelEverageCall = ChangelEverageCall();
  static TradingHistoryCall tradingHistoryCall = TradingHistoryCall();
  static AvailableAmountForWithdrawalCall availableAmountForWithdrawalCall =
      AvailableAmountForWithdrawalCall();
  static SendReportCall sendReportCall = SendReportCall();
  static ReturnSwapFreeRequestFormConfigurationCall
      returnSwapFreeRequestFormConfigurationCall =
      ReturnSwapFreeRequestFormConfigurationCall();
  static CreateRequestSwapFreeApplicationCall
      createRequestSwapFreeApplicationCall =
      CreateRequestSwapFreeApplicationCall();
  static ApplicationsCall applicationsCall = ApplicationsCall();
  static ApplicationsUploadCall applicationsUploadCall =
      ApplicationsUploadCall();
  static ConfigsCall configsCall = ConfigsCall();
  static OneApplicationConfigByIdCall oneApplicationConfigByIdCall =
      OneApplicationConfigByIdCall();
  static DetailedBreakdownOfCashbackAmountsCalculatedForClientsTradingCall
      detailedBreakdownOfCashbackAmountsCalculatedForClientsTradingCall =
      DetailedBreakdownOfCashbackAmountsCalculatedForClientsTradingCall();
  static ChartCall chartCall = ChartCall();
  static ReturnsAListOfAllAvailableChartsIncludingItselfBasicInformationCall
      returnsAListOfAllAvailableChartsIncludingItselfBasicInformationCall =
      ReturnsAListOfAllAvailableChartsIncludingItselfBasicInformationCall();
  static GetListOfDocumentsToAcceptCall getListOfDocumentsToAcceptCall =
      GetListOfDocumentsToAcceptCall();
  static ListOfAcceptedDocumentsCall listOfAcceptedDocumentsCall =
      ListOfAcceptedDocumentsCall();
  static ListOfCompanyDocumentsCall listOfCompanyDocumentsCall =
      ListOfCompanyDocumentsCall();
  static SetAcceptedStatusForListOfDocumentsIdCall
      setAcceptedStatusForListOfDocumentsIdCall =
      SetAcceptedStatusForListOfDocumentsIdCall();
  static OneCompanyDocumentByIdCall oneCompanyDocumentByIdCall =
      OneCompanyDocumentByIdCall();
  static ConfigurationCall configurationCall = ConfigurationCall();
  static DepositStepACall depositStepACall = DepositStepACall();
  static DepositStepBCall depositStepBCall = DepositStepBCall();
  static DepositStepCCall depositStepCCall = DepositStepCCall();
  static DepositDemoCall depositDemoCall = DepositDemoCall();
  static GetAvailableDepositsConfigsCall getAvailableDepositsConfigsCall =
      GetAvailableDepositsConfigsCall();
  static GetAvailableDepositConfigsCall getAvailableDepositConfigsCall =
      GetAvailableDepositConfigsCall();
  static FeesCall feesCall = FeesCall();
  static CurrenciesCall currenciesCall = CurrenciesCall();
  static ReportCurrencyCall reportCurrencyCall = ReportCurrencyCall();
  static AvailableLanguagesCall availableLanguagesCall =
      AvailableLanguagesCall();
  static ReturnAccessTokenForOtherClientApiMethodsCall
      returnAccessTokenForOtherClientApiMethodsCall =
      ReturnAccessTokenForOtherClientApiMethodsCall();
  static DocumentsCall documentsCall = DocumentsCall();
  static DeleteDocumentsCall deleteDocumentsCall = DeleteDocumentsCall();
  static DocumentsUploadCall documentsUploadCall = DocumentsUploadCall();
  static DocumentsConfigsCall documentsConfigsCall = DocumentsConfigsCall();
  static DownloadsCall downloadsCall = DownloadsCall();
  static FileCall fileCall = FileCall();
  static ReturnListOfTicketCommentsCall returnListOfTicketCommentsCall =
      ReturnListOfTicketCommentsCall();
  static CreateATicketCommentOnlyUserCommentCouldBeEditedCall
      createATicketCommentOnlyUserCommentCouldBeEditedCall =
      CreateATicketCommentOnlyUserCommentCouldBeEditedCall();
  static EditATicketCommentOnlyUserCommentCouldBeEditedCall
      editATicketCommentOnlyUserCommentCouldBeEditedCall =
      EditATicketCommentOnlyUserCommentCouldBeEditedCall();
  static DeleteATicketCommentOnlyUserCommentCouldBeDeletedCall
      deleteATicketCommentOnlyUserCommentCouldBeDeletedCall =
      DeleteATicketCommentOnlyUserCommentCouldBeDeletedCall();
  static ReturnUserOpenTicketsCall returnUserOpenTicketsCall =
      ReturnUserOpenTicketsCall();
  static ReturnUserClosedTicketsCall returnUserClosedTicketsCall =
      ReturnUserClosedTicketsCall();
  static ReturnUserTicketsCall returnUserTicketsCall = ReturnUserTicketsCall();
  static ReturnUserTicketCategoriesCall returnUserTicketCategoriesCall =
      ReturnUserTicketCategoriesCall();
  static CreateANewUserTicketCall createANewUserTicketCall =
      CreateANewUserTicketCall();
  static GetUnreadTicketsCountCall getUnreadTicketsCountCall =
      GetUnreadTicketsCountCall();
  static GetTicketDataCall getTicketDataCall = GetTicketDataCall();
  static DeleteTicketTicketWithManagerCommentsCouldNotBeDeletedCall
      deleteTicketTicketWithManagerCommentsCouldNotBeDeletedCall =
      DeleteTicketTicketWithManagerCommentsCouldNotBeDeletedCall();
  static CloseTicketCall closeTicketCall = CloseTicketCall();
  static PublicMethodForGettingMarketingLinkMinimalDetailsCall
      publicMethodForGettingMarketingLinkMinimalDetailsCall =
      PublicMethodForGettingMarketingLinkMinimalDetailsCall();
  static PublicMethodForRegisteringClickAndGettingMarketingLinkMinimalDetailsCall
      publicMethodForRegisteringClickAndGettingMarketingLinkMinimalDetailsCall =
      PublicMethodForRegisteringClickAndGettingMarketingLinkMinimalDetailsCall();
  static PaymentDetailCall paymentDetailCall = PaymentDetailCall();
  static PaymentDetailsCall paymentDetailsCall = PaymentDetailsCall();
  static PaymentDetailRemoveCall paymentDetailRemoveCall =
      PaymentDetailRemoveCall();
  static PaymentDetailsUploadCall paymentDetailsUploadCall =
      PaymentDetailsUploadCall();
  static PaymentDetailsConfigsCall paymentDetailsConfigsCall =
      PaymentDetailsConfigsCall();
  static PinSendCall pinSendCall = PinSendCall();
  static MessagesListCall messagesListCall = MessagesListCall();
  static ViewMessageCall viewMessageCall = ViewMessageCall();
  static GetUnreadMessagesCountCall getUnreadMessagesCountCall =
      GetUnreadMessagesCountCall();
  static GetExistingNotificationsPreferencesCall
      getExistingNotificationsPreferencesCall =
      GetExistingNotificationsPreferencesCall();
  static UpdateNotificationsPreferencesCall updateNotificationsPreferencesCall =
      UpdateNotificationsPreferencesCall();
  static ProfileCall profileCall = ProfileCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static ChangeEmailCall changeEmailCall = ChangeEmailCall();
  static ChangePhoneCall changePhoneCall = ChangePhoneCall();
  static ChangePasswordProfileCall changePasswordProfileCall =
      ChangePasswordProfileCall();
  static ContactManagerDetailsCall contactManagerDetailsCall =
      ContactManagerDetailsCall();
  static UpdateCustomFieldsCall updateCustomFieldsCall =
      UpdateCustomFieldsCall();
  static ChangeCommunicationLanguageCall changeCommunicationLanguageCall =
      ChangeCommunicationLanguageCall();
  static VerifyEmailCall verifyEmailCall = VerifyEmailCall();
  static VerifyEmailValidateCall verifyEmailValidateCall =
      VerifyEmailValidateCall();
  static GenerateQrCodeForTotpAuthAppCall generateQrCodeForTotpAuthAppCall =
      GenerateQrCodeForTotpAuthAppCall();
  static EnableTwoFactorUsingTheCodeFromTotpAuthAppCall
      enableTwoFactorUsingTheCodeFromTotpAuthAppCall =
      EnableTwoFactorUsingTheCodeFromTotpAuthAppCall();
  static DisableTwoFactorCall disableTwoFactorCall = DisableTwoFactorCall();
  static ClearTrustedDevicesCall clearTrustedDevicesCall =
      ClearTrustedDevicesCall();
  static GenerateNewBackupCodesCall generateNewBackupCodesCall =
      GenerateNewBackupCodesCall();
  static GetRegistrationFormConfigurationCall
      getRegistrationFormConfigurationCall =
      GetRegistrationFormConfigurationCall();
  static ThisMethodWillBeRemovedInTheFutureCall
      thisMethodWillBeRemovedInTheFutureCall =
      ThisMethodWillBeRemovedInTheFutureCall();
  static RegisterClientRepeatCabinetRegistrationPageFunctionalityCall
      registerClientRepeatCabinetRegistrationPageFunctionalityCall =
      RegisterClientRepeatCabinetRegistrationPageFunctionalityCall();
  static RegistrationSendPinCall registrationSendPinCall =
      RegistrationSendPinCall();
  static RegistrationConfirmationCall registrationConfirmationCall =
      RegistrationConfirmationCall();
  static LoginUserCall loginUserCall = LoginUserCall();
  static CheckOfTwofactorCodePOSTRequestToClientapiloginEndpointIsRequiredBeforeCallingThisMethodCall
      checkOfTwofactorCodePOSTRequestToClientapiloginEndpointIsRequiredBeforeCallingThisMethodCall =
      CheckOfTwofactorCodePOSTRequestToClientapiloginEndpointIsRequiredBeforeCallingThisMethodCall();
  static LogoutCall logoutCall = LogoutCall();
  static GetPinForForgotPasswordMethodCall getPinForForgotPasswordMethodCall =
      GetPinForForgotPasswordMethodCall();
  static ChangeClientsPasswordCall changeClientsPasswordCall =
      ChangeClientsPasswordCall();
  static GetAuthUrlCall getAuthUrlCall = GetAuthUrlCall();
  static UserAuthCall userAuthCall = UserAuthCall();
  static ConnectSocialServiceToUserCall connectSocialServiceToUserCall =
      ConnectSocialServiceToUserCall();
  static DisconnectSocialServiceToUserCall disconnectSocialServiceToUserCall =
      DisconnectSocialServiceToUserCall();
  static PingCall pingCall = PingCall();
  static GetDataForCreatingATradeCalculatorFormCall
      getDataForCreatingATradeCalculatorFormCall =
      GetDataForCreatingATradeCalculatorFormCall();
  static DoATradeCalculationCall doATradeCalculationCall =
      DoATradeCalculationCall();
  static CancelTransactionReturnAccessDeniedIfTransactionCannotBeCanceledCall
      cancelTransactionReturnAccessDeniedIfTransactionCannotBeCanceledCall =
      CancelTransactionReturnAccessDeniedIfTransactionCannotBeCanceledCall();
  static TransactionsCall transactionsCall = TransactionsCall();
  static TransfersCall transfersCall = TransfersCall();
  static ApproximateTransferResultCall approximateTransferResultCall =
      ApproximateTransferResultCall();
  static TransfersNewCall transfersNewCall = TransfersNewCall();
  static TransfersAnyNewCall transfersAnyNewCall = TransfersAnyNewCall();
  static MethodPayoutNotWithdrawalBecauseWeHadWithdrawalAndMarkedItAsDeprecatedAndShouldBeRemovedCall
      methodPayoutNotWithdrawalBecauseWeHadWithdrawalAndMarkedItAsDeprecatedAndShouldBeRemovedCall =
      MethodPayoutNotWithdrawalBecauseWeHadWithdrawalAndMarkedItAsDeprecatedAndShouldBeRemovedCall();
  static GetWithdrawalDetailCall getWithdrawalDetailCall =
      GetWithdrawalDetailCall();
  static GetAvailableWithdrawalsConfigsCall getAvailableWithdrawalsConfigsCall =
      GetAvailableWithdrawalsConfigsCall();
  static GetAvailableWithdrawalConfigsCall getAvailableWithdrawalConfigsCall =
      GetAvailableWithdrawalConfigsCall();
  static BannersCall bannersCall = BannersCall();
  static CampaignsCall campaignsCall = CampaignsCall();
  static BannerGetCodeCall bannerGetCodeCall = BannerGetCodeCall();
  static ReferralsCall referralsCall = ReferralsCall();
  static ReferralsAccountsCall referralsAccountsCall = ReferralsAccountsCall();
  static CommissionsCall commissionsCall = CommissionsCall();
  static IBDashboardIBTransactionsCall iBDashboardIBTransactionsCall =
      IBDashboardIBTransactionsCall();
  static LinksCall linksCall = LinksCall();
  static LinksLandingPagesCall linksLandingPagesCall = LinksLandingPagesCall();
  static LinksNewCall linksNewCall = LinksNewCall();
  static LinksEditCall linksEditCall = LinksEditCall();
  static LinksRemoveCall linksRemoveCall = LinksRemoveCall();
  static PublicMethodForGettingIbLinkMinimalDetailsCall
      publicMethodForGettingIbLinkMinimalDetailsCall =
      PublicMethodForGettingIbLinkMinimalDetailsCall();
  static PublicMethodForRegisteringClickAndGettingIbLinkMinimalDetailsCall
      publicMethodForRegisteringClickAndGettingIbLinkMinimalDetailsCall =
      PublicMethodForRegisteringClickAndGettingIbLinkMinimalDetailsCall();
  static IBReportsOtherNetworkCommissionCall
      iBReportsOtherNetworkCommissionCall =
      IBReportsOtherNetworkCommissionCall();
  static IBReportsAccountsCommissionCall iBReportsAccountsCommissionCall =
      IBReportsAccountsCommissionCall();
  static IBReportsClientsCommissionCall iBReportsClientsCommissionCall =
      IBReportsClientsCommissionCall();
  static IBReportsCPAPaymentsCall iBReportsCPAPaymentsCall =
      IBReportsCPAPaymentsCall();
  static IBTreeDataCall iBTreeDataCall = IBTreeDataCall();
  static ReferralBreakdownCall referralBreakdownCall = ReferralBreakdownCall();
  static PerformanceDashboardCall performanceDashboardCall =
      PerformanceDashboardCall();
  static ScreeningTokenCall screeningTokenCall = ScreeningTokenCall();
  static WidgetsCall widgetsCall = WidgetsCall();
  static WidgetCall widgetCall = WidgetCall();
}

class PayoutCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'payout',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/payout_restrictions',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TypesCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'types',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/accounts/types',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AccountsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'accounts',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/accounts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NewAccountCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'new account',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/accounts/new',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangePasswordAccountCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'change password account',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/accounts/change/password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangelEverageCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'changel everage',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/accounts/change/leverage',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TradingHistoryCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'trading history',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/accounts/trading-history',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AvailableAmountForWithdrawalCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? loginSid = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'available amount for withdrawal',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/accounts/$loginSid/available-amount-for-withdrawal',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SendReportCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'send report',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/accounts/change/send-report',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReturnSwapFreeRequestFormConfigurationCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? loginSid = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Return swap free request form configuration.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/accounts/$loginSid/swap-free-request-form/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateRequestSwapFreeApplicationCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? loginSid = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create request swap free application.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/accounts/$loginSid/swap-free-request/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApplicationsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'applications',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/applications',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApplicationsUploadCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'applications upload',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/applications/upload',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ConfigsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'configs',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/applications/configs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OneApplicationConfigByIdCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? locale = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'One application config by id.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/applications/configs/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
        '_locale': locale,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DetailedBreakdownOfCashbackAmountsCalculatedForClientsTradingCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'Detailed breakdown of cashback amounts calculated for clients trading',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/cashback-breakdown',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChartCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? name = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'chart',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/chart/$name',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReturnsAListOfAllAvailableChartsIncludingItselfBasicInformationCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'Returns a list of all available charts including itself basic information',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/charts-info',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetListOfDocumentsToAcceptCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get list of documents to accept.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/company-documents/for-accept',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListOfAcceptedDocumentsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'List of accepted documents.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/company-documents/accepted',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListOfCompanyDocumentsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'List of company documents.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/company-documents/all',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SetAcceptedStatusForListOfDocumentsIdCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Set accepted status for list of documents id.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/company-documents/accept',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OneCompanyDocumentByIdCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'One company document by id.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/company-documents/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ConfigurationCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'configuration',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/configuration',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DepositStepACall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deposit step a',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/deposit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DepositStepBCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deposit step b',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/deposit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DepositStepCCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deposit step c',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/deposit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DepositDemoCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deposit demo',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/deposit/demo',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAvailableDepositsConfigsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get available deposits configs',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/payment-systems/deposit',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAvailableDepositConfigsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? loginSid = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get available deposit configs.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/payment-systems/deposit/$loginSid',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FeesCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'fees',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/deposit/fees',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CurrenciesCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Currencies.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/dict/currencies',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReportCurrencyCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Report Currency.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/dict/report-currency',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AvailableLanguagesCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Available Languages.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/dict/languages',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReturnAccessTokenForOtherClientApiMethodsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? hash = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Return access token for other client api methods.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/login/direct',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
        'hash': hash,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DocumentsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'documents',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/documents',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteDocumentsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'delete documents',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/documents/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DocumentsUploadCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'documents upload',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/documents/upload',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DocumentsConfigsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'documents configs',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/documents/configs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DownloadsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'downloads',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/downloads',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FileCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? path = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'file',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/file',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
        'path': path,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReturnListOfTicketCommentsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Return list of ticket comments.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/help-desk/ticket-comments/all',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateATicketCommentOnlyUserCommentCouldBeEditedCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create a ticket comment. Only user comment could be edited.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/help-desk/ticket-comments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditATicketCommentOnlyUserCommentCouldBeEditedCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Edit a ticket comment. Only user comment could be edited.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/help-desk/ticket-comments/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteATicketCommentOnlyUserCommentCouldBeDeletedCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete a ticket comment. Only user comment could be deleted.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/help-desk/ticket-comments/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReturnUserOpenTicketsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Return user open tickets.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/help-desk/tickets/open',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReturnUserClosedTicketsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Return user closed tickets.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/help-desk/tickets/closed',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReturnUserTicketsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Return user tickets.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/help-desk/tickets/all',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReturnUserTicketCategoriesCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Return user ticket categories.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/help-desk/ticket-categories',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateANewUserTicketCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create a new user ticket.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/help-desk/tickets',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUnreadTicketsCountCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get unread tickets count.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/help-desk/unread-tickets-count',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetTicketDataCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get ticket data.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/help-desk/tickets/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteTicketTicketWithManagerCommentsCouldNotBeDeletedCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'Delete ticket Ticket with manager comments could not be deleted',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/help-desk/tickets/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CloseTicketCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Close ticket.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/help-desk/tickets/$id/close',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PublicMethodForGettingMarketingLinkMinimalDetailsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Public method for getting marketing link minimal details',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/marketing/public/link-detail/$id/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PublicMethodForRegisteringClickAndGettingMarketingLinkMinimalDetailsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'Public method for registering click and getting marketing link minimal details',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/marketing/public/link-detail/$id/click/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentDetailCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? paymentSystemId = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'payment detail',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/payment-details/$paymentSystemId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentDetailsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'payment details',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/payment-details',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentDetailRemoveCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'payment detail remove',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/payment-details/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentDetailsUploadCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'payment details upload',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/payment-details/upload',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentDetailsConfigsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'payment details configs',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/payment-details/configs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PinSendCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'pin send',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/pin/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MessagesListCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Messages list.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile/messages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ViewMessageCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'View message.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile/messages/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUnreadMessagesCountCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get unread messages count.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/profile/messages/unread-count',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetExistingNotificationsPreferencesCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get existing notifications preferences.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/profile/notification-preferences/options',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateNotificationsPreferencesCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update notifications preferences.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/profile/change/notification-preferences',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProfileCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'profile',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update profile.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangeEmailCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Change email.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile/change-email',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangePhoneCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Change phone.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile/change-phone',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangePasswordProfileCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' change password profile',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile/change-password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ContactManagerDetailsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'contact manager details',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/profile/contact-manager-details',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateCustomFieldsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'update custom fields',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/profile/update-custom-fields',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangeCommunicationLanguageCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Change Communication Language.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile/change-language',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VerifyEmailCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'verify email',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile/verify-email',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VerifyEmailValidateCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? hash = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'verify email validate',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/profile/verify-email/validate/$hash',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GenerateQrCodeForTotpAuthAppCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Generate qr code for totp auth app.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile/two-factor/qr-code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EnableTwoFactorUsingTheCodeFromTotpAuthAppCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Enable two factor using the code from totp auth app.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile/two-factor/enable',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DisableTwoFactorCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Disable two factor.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/profile/two-factor',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ClearTrustedDevicesCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Clear trusted devices.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/profile/two-factor/clear-trusted',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GenerateNewBackupCodesCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Generate new backup codes.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/profile/two-factor/backup-codes',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetRegistrationFormConfigurationCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get registration form configuration.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/registration',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ThisMethodWillBeRemovedInTheFutureCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'This method will be removed in the future.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/registration',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RegisterClientRepeatCabinetRegistrationPageFunctionalityCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'Register client repeat cabinet registration page functionality.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/registration',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RegistrationSendPinCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'registration send pin',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/registration/send-pin',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RegistrationConfirmationCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'registration confirmation',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/registration/confirmation',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginUserCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Login user',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CheckOfTwofactorCodePOSTRequestToClientapiloginEndpointIsRequiredBeforeCallingThisMethodCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? loginTwoFactorRequest = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'Check of twofactor code POST request to clientapilogin endpoint is required before calling this method',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/2fa-check',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'logout',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/logout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPinForForgotPasswordMethodCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? host = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get pin for forgot-password method.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/forgot-password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangeClientsPasswordCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? pin = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Change client\'s password.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/forgot-password/$pin',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAuthUrlCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get auth url.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/social-login/url',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserAuthCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User auth.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/social-login/auth',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ConnectSocialServiceToUserCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Connect social service to user.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/social-login/connect',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DisconnectSocialServiceToUserCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? service = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Disconnect social service to user.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/social-login/disconnect/$service',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PingCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ping',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ping',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetDataForCreatingATradeCalculatorFormCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get data for creating a Trade Calculator form.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/trading-calculator/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DoATradeCalculationCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Do a trade calculation.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/trading-calculator/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CancelTransactionReturnAccessDeniedIfTransactionCannotBeCanceledCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'Cancel transaction Return Access denied if transaction cannot be canceled',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/transactions/cancel/$id',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TransactionsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'transactions',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/transactions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TransfersCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'transfers',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/transfers/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApproximateTransferResultCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Approximate transfer result.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/transfers/check',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TransfersNewCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'transfers new',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/transfers/new',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TransfersAnyNewCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'transfers any new',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/transfers/any/new',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MethodPayoutNotWithdrawalBecauseWeHadWithdrawalAndMarkedItAsDeprecatedAndShouldBeRemovedCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'Method payout not withdrawal because we had withdrawal and marked it as deprecated and should be removed',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/payout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetWithdrawalDetailCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get withdrawal detail.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/withdrawal/detail',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAvailableWithdrawalsConfigsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get available withdrawals configs',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/payment-systems/withdrawal',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAvailableWithdrawalConfigsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? loginSid = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get available withdrawal configs.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/payment-systems/withdrawal/$loginSid',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BannersCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'banners',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/banners',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CampaignsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'campaigns',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/banners/campaigns',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BannerGetCodeCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? linkId = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'banner get code',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/ib/banners/$id/get-code/$linkId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReferralsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'referrals',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/referrals',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReferralsAccountsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'referrals accounts',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/referrals/accounts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CommissionsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'commissions',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/commissions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class IBDashboardIBTransactionsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'IB -> Dashboard -> IB Transactions.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/ib-transactions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LinksCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'links',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/links',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LinksLandingPagesCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'links landing pages',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/links/landing-pages',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LinksNewCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'links new',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/links/new',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LinksEditCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'links edit',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/links/$id/edit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LinksRemoveCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'links remove',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/links/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PublicMethodForGettingIbLinkMinimalDetailsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Public method for getting ib link minimal details.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/ib/public/link-detail/$id/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PublicMethodForRegisteringClickAndGettingIbLinkMinimalDetailsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'Public method for registering click and getting ib link minimal details',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/ib/public/link-detail/$id/click/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class IBReportsOtherNetworkCommissionCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'IB -> Reports -> Other Network Commission.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/ib/reports/other-network-commissions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class IBReportsAccountsCommissionCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'IB -> Reports -> Accounts Commission.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/ib/reports/accounts-commissions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class IBReportsClientsCommissionCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'IB -> Reports -> Clients Commission.',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/ib/reports/clients-commissions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class IBReportsCPAPaymentsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'IB -> Reports -> CPA Payments.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/reports/cpa-payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class IBTreeDataCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'IB tree data.',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/tree',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReferralBreakdownCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? id = '',
    String? body = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'referral breakdown',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/ib/referral-breakdown/$id',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PerformanceDashboardCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? from = '',
    String? to = '',
    String? currency = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'performance dashboard',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/ib/performance-dashboard',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
        'from': from,
        'to': to,
        'currency': currency,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ScreeningTokenCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'screening token',
      apiUrl:
          '${ClientAPIGroup.baseUrl}/client-api/kyc/global-pass/screening-token',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class WidgetsCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'widgets',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/widgets',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class WidgetCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? alias = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'widget',
      apiUrl: '${ClientAPIGroup.baseUrl}/client-api/widgets/$alias',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'version': version,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End ClientAPI Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
