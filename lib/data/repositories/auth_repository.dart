import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/api_const.dart';
import '../../core/constants/storage_const.dart';
import '../../core/error/app_error.dart';
import '../models/user_model.dart';
import '../services/hive_storage_service.dart';
import '../services/secure_storage_service.dart';

class AuthRepository {
  Future<Either<UserModel, AppError>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final signUpResponse = await http.post(
        Uri.parse(ApiConst.signup),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      final resBodyMap =
          jsonDecode(signUpResponse.body) as Map<String, dynamic>;

      if (signUpResponse.statusCode != 201) {
        return Right(AppError(message: resBodyMap['detail']));
      }

      final loginResponse = await login(email: email, password: password);

      return loginResponse.match(
        (userData) => Left(userData),
        (error) => Right(error),
      );
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  Future<Either<UserModel, AppError>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConst.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        return Right(AppError(message: resBodyMap['detail'] as String));
      }

      final secureStorateService = SecureStorageService();
      secureStorateService.write(
        key: StorageConst.jwtStorageKey,
        value: resBodyMap['token'],
    );

      return Left(UserModel.fromMap(resBodyMap['user']));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  // Future<Either< getCurrentUser() async {}
}
