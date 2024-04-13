// ignore_for_file: avoid_print

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:eye2sight/constants/getstorage_keys_constants.dart';
import 'package:eye2sight/constants/uri_constants.dart';
import 'package:eye2sight/controllers/conectivity_controller.dart';
import 'package:eye2sight/widgets/custom_snackbar.dart';
import 'package:get/get.dart' as getx;
import 'package:get_storage/get_storage.dart';

class ApiService {
  final Dio _dio = Dio();
  final Duration timeOut = const Duration(seconds: 60);
  final box = GetStorage();
  Future<Response?> post(
    String path,
    dynamic data, {
    bool? isAuthorized,
    Map<String, dynamic>? additionalHeaders,
  }) async {
    ConnectivityController connectivityController = getx.Get.find();

    if (connectivityController.isInternetAvailable.isTrue) {
      Map<String, dynamic> headers = {};

      final String? accessToken = box.read(GetStorageKeys.accessToken);

      if (isAuthorized == true) {
        headers['Authorization'] = 'Bearer $accessToken';
      }

      if (additionalHeaders != null) {
        headers.addAll(additionalHeaders);
      }

      try {
        print(path);
        print(headers);
        final response = await _dio.post(
          URIConstants.baseURI + path,
          data: data,
          options: Options(
            headers: headers,
          ),
        );
        return response;
      } catch (error) {
        _handleError(error);
        rethrow;
      }
    } else {
      CustomSnackBar.showSnackBar(
        CustomSnackBar.error,
        'No connection available',
        CustomSnackBar.error,
      );
      return null;
    }
  }

  void _handleError(dynamic error) {
    if (error is DioException) {
      final dioError = error;
      if (dioError.response != null) {
        // Handle DioError with a response (e.g., server returned an error)
        CustomSnackBar.showSnackBar(CustomSnackBar.error,
            'An unexpected error occurred.', CustomSnackBar.error);
      } else {
        // Handle DioError without a response (e.g., network connectivity issue)

        CustomSnackBar.showSnackBar(CustomSnackBar.error,
            'Timeout. Please check your connection.', CustomSnackBar.error);
      }
    } else {
      // Handle generic errors (e.g., unexpected errors)
      CustomSnackBar.showSnackBar(CustomSnackBar.error,
          'An unexpected error occurred.', CustomSnackBar.error);
    }
  }
}
