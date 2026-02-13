import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/api_const.dart';
import '../../../../core/error/app_error.dart';
import '../models/user_model.dart';

class AuthService {
  Future<Either<UserModel, AppError>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConst.signup),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 201) {
        return Right(AppError(message: resBodyMap['detail']));
      }

      return Left(UserModel.fromMap(resBodyMap));
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

      return Left(UserModel.fromMap(resBodyMap['user']));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }
}
