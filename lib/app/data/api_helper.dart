import 'package:get/get.dart';

import '../models/user.dart';

abstract class ApiHelper {
  Future<Response> getAllUsers();

  Future<Response> getUserLimit(int numberOfUser);

  Future<Response> getUserDetails(int userId);

  Future<Response> getAllProducts();

  Future<Response> getProductDetails(int productId);

  Future<Response> getAllCategory();

  Future<Response> getProductsByCategory(String category);

  Future<Response> signIn(User user);
}
