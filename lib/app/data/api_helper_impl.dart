import 'dart:async';

import 'package:resumedemo/app/models/user.dart';

import '../common/util/exports.dart';
import 'interceptor.dart';

class ApiHelperImpl extends GetConnect with ApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = Constants.timeout;

    addRequestModifier();

    httpClient.addResponseModifier(
      (request, response) => interceptor(
        httpClient,
        request,
        response,
      ),
    );
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      if (Storage.hasData(StorageHelper.loggedInToken)) {
        request.headers['Authorization'] = "Bearer ${Storage.getValue(StorageHelper.loggedInToken)}";
      }

      printInfo(
        info: 'REQUEST ║ ${request.method.toUpperCase()}\n'
            'url: ${request.url}\n'
            'Headers: ${request.headers}\n'
            'Body: ${request.files?.toString() ?? ''}\n',
      );

      return request;
    });
  }

  @override
  Future<Response> getAllUsers() async {
    return await get("users");
  }

  @override
  Future<Response> getUserDetails(int userId) async {
    return await get("users/$userId");
  }

  @override
  Future<Response> getUserLimit(int numberOfUser) async {
    return await get("users?limit=$numberOfUser");
  }

  @override
  Future<Response> getAllCategory() async {
    return await get("products/categories");
  }

  @override
  Future<Response> getAllProducts() async {
    return await get("products");
  }

  @override
  Future<Response> getProductDetails(int productId) async {
    return await get("products/$productId");
  }

  @override
  Future<Response> getProductsByCategory(String category) async {
    return await get("products/category/$category");
  }

  @override
  Future<Response> signIn(User user) async {
    return await post("auth/login", {
      "username": user.username,
      "password": user.password,
    });
  }
}