import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:stack_trace/stack_trace.dart';

import '../../model/api_error.dart';
import '../exceptions/exceptions.dart';

extension ResponseUtils on http.Response {
  bool get isSuccess {
    return statusCode >= 200 && statusCode < 300;
  }

  bool get hasError => !isSuccess;

  dynamic get json => jsonDecode(body);

  Map<String, dynamic>? get jsonMap => json as Map<String, dynamic>?;

  List<dynamic>? get jsonList => json as List<dynamic>?;

  APIException get error {
    if (statusCode == 401) {
      return UnauthorizedException(error: ApiError((ApiErrorBuilder b) {
        b.message = 'Unauthorized';
      }));
    }

    try {
      return APIException(error: ApiError.fromJson(jsonMap!));
    } catch (e) {
      if (e.toString().toLowerCase().contains('unauthorized')) {
        return UnauthorizedException(error: ApiError((ApiErrorBuilder b) {
          b.message = 'Unauthorized';
        }));
      }
      return SomethingWentWrongAPI(error: ApiError((ApiErrorBuilder b) {
        b.message = 'Something went wrong';
      }));
    }
  }

  String toCurl() => APILog._cURLRepresentation(request!);
}

abstract class ApiClient {
  static const int maxRetries = 1;

  void setAuthHandlers({
    Future<void> Function()? onLogout,
    Future<void> Function()? onRefresh,
  });

  Future<void> refreshToken() async {}

  Future<void> logout() async {}

  Future<http.Response> interceptResponse(
      Future<http.Response> Function() request,
      [int retry = 0]) async {
    try {
      final Trace s = Trace.current();
      final http.Response response = await request();
      final APILog apiLog = APILog._(response, s);
      APILog.allApiLogs.add(apiLog);
      if (kDebugMode) {
        print('''
    $apiLog
      ''');
      }
      if (response.isSuccess) {
        return response;
      }

      throw response.error;
    } catch (e) {
      if (e is UnauthorizedException) {
        // refresh token and retry request
        if (retry < maxRetries) {
          await refreshToken();
          return interceptResponse(request, retry + 1);
        }

        // logout
        if (retry == maxRetries) {
          await logout();
        }
      }

      rethrow;
    }
  }

  void setAuthorizationKey(String? key);

  void setTenantCompanyID({
    required String tid,
    required String cid,
  });

  Map<String, String> get defaultHeaders => <String, String>{};

  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async =>
      interceptResponse(
        () => http.get(url, headers: <String, String>{
          ...defaultHeaders,
          ...?headers,
        }),
      );

  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return interceptResponse(
      () => http.post(
        url,
        headers: <String, String>{
          ...defaultHeaders,
          ...?headers,
        },
        body: body,
        encoding: encoding,
      ),
    );
  }

  Future<http.Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async =>
      interceptResponse(
        () => http.put(
          url,
          headers: <String, String>{
            ...defaultHeaders,
            ...?headers,
          },
          body: body,
          encoding: encoding,
        ),
      );

  Future<http.Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async =>
      interceptResponse(
        () => http.patch(
          url,
          headers: <String, String>{
            ...defaultHeaders,
            ...?headers,
          },
          body: body,
          encoding: encoding,
        ),
      );

  Future<http.Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async =>
      interceptResponse(
        () => http.delete(
          url,
          headers: <String, String>{
            ...defaultHeaders,
            ...?headers,
          },
          body: body,
          encoding: encoding,
        ),
      );
}

class APILog {
  APILog._(this._r, this._reqStack) : logTime = DateTime.now();
  static final List<APILog> allApiLogs = <APILog>[];
  final http.Response _r;
  final Trace _reqStack;
  final DateTime logTime;

  String? _id;

  String get id {
    _id ??= logTime.microsecondsSinceEpoch.toString();
    return _id!;
  }

  // static final _jsonEncoder = JsonEncoder.withIndent(' ');
  // String? _log;

  Uri get uri => _r.request!.url;

  String get method => _r.request!.method;

  String get status => _r.statusCode.toString();

  bool get isSuccess => _r.isSuccess;

  String get curlRequest => _cURLRepresentation(_r.request!);

  String get stackTrace => _reqStack.toString();

  String get responseBody => _r.body;

  static String _cURLRepresentation(http.BaseRequest options) {
    final List<String> components = <String>['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((String k, String v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options is http.Request && options.body.isNotEmpty) {
      final String data = options.body.replaceAll('"', r'\"');
      components.add('-d "$data"');
    }

    components.add('"${options.url}"');

    return components.join(' \\\n\t');
  }

  @override
  String toString() {
    return '''
REQUEST:
  ${_r.toCurl()}

RESPONSE:
  STATUS CODE: ${_r.statusCode}
  BODY: ${_r.body}
  
STACK TRACE:
  $_reqStack
''';
  }
}
