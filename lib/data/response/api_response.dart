import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../features/home/model/movies_model.dart';
import '../../features/home/model/product_list.dart';
import '../../features/auth/model/user_model.dart';
import '../../features/register/model/user_register_model.dart';
import '../../utils/enums/status.dart';
import '../app_excaptions.dart';



class ApiResponse<T> {
  Status? status;

  T? data;

  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}

class Parser {
  static Future<UserModel> parseLogInResponse(String responseBody) async {
    return UserModel.fromJson(json.decode(responseBody));
  }

  static Future<UserRegister> parseUserRegisterResponse(String responseBody) async {
    return UserRegister.fromJson(json.decode(responseBody));
  }

  static Future<List<ProductListingModel>> parseProductListResponse(String responseBody) async {
    var jsonDataList = jsonDecode(responseBody);
    List<ProductListingModel> products = List<ProductListingModel>.from(jsonDataList.map((item) => ProductListingModel.fromJson(item)));
    return products;
  }

  static Future<ProductListingModel> parseProductResponse(String responseBody) async {
    return ProductListingModel.fromJson(json.decode(responseBody));
  }

  static Future<Either<AppException, Q>> parseResponse<Q, R>(
      http.Response response, ComputeCallback<String, R> callback) async {
    if (response == null) {
      print('response is null ');
      return Left(UnknownError());
    } else {
      // log('callback : ${callback.toString()}response.statusCode : ${response.statusCode} | response.body ${response.body}');
      try {
        switch (response.statusCode) {
          case 200:
            {
              var result = await compute(callback, response.body.toString());
              return Right(result as Q);
            }
          // break;
          case 401:
            return Left(ForbiddenError());
            break;
          case 403:
            return Left(UnAuthorizedError());
            break;
          case 404:
            return Left(ServerError(
                statusCode: response.statusCode, message: "File not found"));
            break;
          case 500:
            return Left(ServerError(
                statusCode: response.statusCode, message: "Server Failure"));
            break;
          default:
            return Left(UnknownError(
                statusCode: response.statusCode, message: response.body));
        }
      } catch (e) {
        // throw e;
        return Left(UnknownError());
      }
    }
  }
}
