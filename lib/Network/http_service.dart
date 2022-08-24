// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
import '../Service/StorageService.dart';
import '../Utils/helper.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

const BASE_URL = "http://crmshannon.awdweb.com.au/";
// const BASE_URL = "http://192.168.43.175:82/api/";

class HttpService {
  Dio? _dio;

  Logger logger = Get.find();
  final storage = Get.find<StorageService>();
  var i = 1;
  var paging = true;

  static header() => {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json'
      };

  HttpService init() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
    ));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          requestOptions.headers.remove("requiresToken");
          // var data = storage.read(AppConstant.prefUserDetail);
          // LoginResData? login;
          // if (data != null) login = LoginResData.fromJson(jsonDecode(data));
          requestOptions.headers.addAll(
            {
              "Accept": "application/json",
              "Content-Type": "application/x-www-form-urlencoded",
              // "Dealerid": login?.dealerId ?? 0,
              // "authtoken": login?.authToken ?? '',
            },
          );
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger.i(
              "RESPONSE[${response.statusCode}] => RES DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          logger.i("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
      LogInterceptor(requestBody: true)
    ]);
  }

  Future<dynamic> requestMultipart(
      {required String url, required Method method, FormData? param}) async {
    Response response;

    try {
      response = await _dio!.post(url, data: param);

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      logger.e(e);
      throw Exception("Not Internet Connection");
    } on FormatException catch (e) {
      logger.e(e);
      throw Exception("Bad response format");
    } on DioError catch (e) {
      logger.e(e);
      throw Exception(e);
    } catch (e) {
      logger.e(e);
      throw Exception("Something wen't wrong");
    }
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params,
      Map<String, dynamic>? qParams}) async {
    Response response;

    try {
      if (method == Method.POST) {
        response =
            await _dio!.post(url, data: params, queryParameters: qParams);
      } else if (method == Method.DELETE) {
        response = await _dio!.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio!.patch(url);
      } else {
        response = await _dio!.get(url, queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      logger.e(e);
      Helper().noInternetSnackBar();
    } on FormatException catch (e) {
      logger.e(e);
      throw Exception("Bad response format");
    } on DioError catch (e) {
      logger.e(e);
      throw Exception(e);
    } catch (e) {
      logger.e(e);
      throw Exception("Something wen't wrong");
    }
  }
}
