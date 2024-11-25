

import '../core/api/api_client.dart';

class ApiClientImpl extends ApiClient {
  @override
  void setAuthHandlers({
    Future<void> Function()? onLogout,
    Future<void> Function()? onRefresh,
  }) {

  }

  @override
  void setAuthorizationKey(String? key) {

  }


}
