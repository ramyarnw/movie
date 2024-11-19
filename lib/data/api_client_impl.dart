import 'dart:convert';

import 'package:http/src/response.dart';

import '../core/api/api_client.dart';

class ApiClientImpl extends ApiClient {
  @override
  void setAuthHandlers({
    Future<void> Function()? onLogout,
    Future<void> Function()? onRefresh,
  }) {
    // TODO: implement setAuthHandlers
  }

  @override
  void setAuthorizationKey(String? key) {
    // TODO: implement setAuthorizationKey
  }

  @override
  void setTenantCompanyID({
    required String tid,
    required String cid,
  }) {
    // TODO: implement setTenantCompanyID
  }
}
