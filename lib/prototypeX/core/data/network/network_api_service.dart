import 'dart:convert';
import 'package:getx_testing/prototypeX/core/data/network/base_api_service.dart';
import 'package:dio/dio.dart';
import 'package:getx_testing/prototypeX/core/utils/app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  Dio dio = Dio();

  @override
  Future<dynamic> getApi(String uri) async {
    final data;
    try {
      final response = await dio.get(uri);
      data = returnResponse(response);
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on InternetExceptions {
      throw InternetExceptions();
    }
    return data;
  }

  @override
  Future<dynamic> postApi(var data, String uri) async {
    final postData;
    try {
      final response = await dio.post(uri, data: data);
      postData = returnResponse(response);
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on InternetExceptions {
      throw InternetExceptions();
    }
    return postData;
  }

  dynamic returnResponse(Response response) {
    final data = response;
    switch (response.statusCode) {
      case 200:
        return jsonDecode(data.data);
      case 400:
        throw RequestTimeOut();
    }
  }
}
