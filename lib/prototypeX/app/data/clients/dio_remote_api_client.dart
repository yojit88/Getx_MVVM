import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/values/constants/app_constants.dart';
import '../../../core/values/constants/server_endpoints.dart';

class DioRemoteApiClient extends GetxService {
  final Dio apiClient = Dio();

  DioRemoteApiClient() {

    initApiClient();
  }

  initApiClient() {
    apiClient.options.baseUrl = ApiEndpoints.baseURL;
    final List<Interceptor> interceptors = <Interceptor>[];

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Endpoints that don't require authentication token
          final excludedEndpoints_1 = ['/login', '/signUp'];
          // Additional public endpoints (customize as needed)
          final excludedEndpoints_2 = ['/apiendpoint_1', '/apiendpoint_2'];

          if (excludedEndpoints_1.any((endpoint) => options.path.contains(endpoint))) {
            // Login or Signup API
            // No token required, set headers as needed
            options.validateStatus = (status) => true;
            options.headers['Content-Type'] = 'application/json';

            // Example: If login API requires a client ID
            // options.headers['x-client-id'] = 'myAppId123';

          } else if (excludedEndpoints_2.any((endpoint) => options.path.contains(endpoint))) {
            // Public APIs
            // No token required, set headers as needed
            options.validateStatus = (status) => true;
            options.headers['Content-Type'] = 'application/json';

            // Example: If public API requires an API key
            // options.headers['x-api-key'] = 'your_api_key_here';

          } else {
            // Protected APIs
            // Attach token and any other custom headers
            options.validateStatus = (status) => true;
            options.headers['Content-Type'] = 'application/json';

            // Example: Add token or custom headers here
            // final token = await getTokenFromStorage();
            // options.headers['Authorization'] = 'Bearer $token';
            // options.headers['x-custom-header'] = 'customValue';
          }

          return handler.next(options); // Continue request
        },
        onResponse: (response, handler) {
          // Handle API response normally
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          // Handle API errors globally (like token expiry, network issues, etc.)
          return handler.next(error);
        },
      ),
    );

    if (kDebugMode) {
      // Add pretty logger only in debug mode for easier debugging
      interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          request: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }

    apiClient.interceptors.addAll(interceptors);
  }
}
