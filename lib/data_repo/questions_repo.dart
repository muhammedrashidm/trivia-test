import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:http/http.dart';
import '../network_helpers/api.dart';

class QuestionsRepo extends GetxService {
  final Api api;
  static const URL = "https://opentdb.com/api.php?amount=10&type=multiple";
  QuestionsRepo({required this.api});

  Future<dynamic> getQuestions() async {
    try {
      final response = await api.getRequest(URL);

      if (response.statusCode == 200) {
        return ApiSuccess(data: response.body, success: true);
      }
    } on SocketException catch (e) {
      return ApiError(errorMessage: 'Network Error', success: false);
    } catch (e) {
      return ApiError(errorMessage: 'Unknown Error', success: false);
    }
  }
}

class ApiSuccess {
  dynamic data;
  bool success;
  ApiSuccess({required this.data, required this.success});
}

class ApiError {
  final String errorMessage;
  final bool success;
  ApiError({required this.errorMessage, required this.success});
}
