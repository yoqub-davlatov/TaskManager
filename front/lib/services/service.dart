import 'dart:developer';

import 'package:front/utils/app_constants.dart';
import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(final String uri) async {
    log(AppConstants.baseURL + uri);
    Response response = await get(
      AppConstants.baseURL + uri,
      headers: {
        "Content-Type": "application/json; charset = UTF-8",
      },
    );
    return response;
  }

  Future<Response> postData(String uri, dynamic body) async {
    Response response = await post(
      AppConstants.baseURL + uri,
      body,
      headers: {
        "Content-Type": "application/json; charset = UTF-8",
      },
    );
    return response;
  }
}
