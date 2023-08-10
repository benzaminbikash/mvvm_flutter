import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/appException.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getReponse(String url) async {
    dynamic jsonData;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      jsonData = returnResponse(response);
    } on SocketException {
      throw FetchException('No Internet Connection');
    }
    return jsonData;
  }

  @override
  Future getPostResponse(String url, dynamic data) async {
    dynamic jsonData;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      jsonData = returnResponse(response);
    } on SocketException {
      throw FetchException('No Internet Connection');
    }
    return jsonData;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchException("Error occur while communicating with server!");
    }
  }
}
