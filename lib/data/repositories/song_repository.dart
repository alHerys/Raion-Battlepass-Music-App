import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/api_const.dart';
import '../../core/error/app_error.dart';
import '../models/song_model.dart';

class SongRepository {
  Future<Either<List<SongModel>, AppError>> getall() async {
    final response = await http.get(Uri.parse(ApiConst.getAllSong));

    if (response.statusCode != 200) {
      return Right(
        AppError(
          message: 'Error Occured with status code: ${response.statusCode}',
        ),
      );
    }

    final jsonList = jsonDecode(response.body);

    return Left(jsonList.map((json) => SongModel.fromJson(json)).toList());
  }

  // Future<void> upload() async {
  //   final response = await http.post(Uri.parse(ApiConst.uploadSong));

  //   if (response.statusCode != ) {

  //   }
  // }

  Future<Either<List<SongModel>, AppError>> mySong(String token) async {
    final response = await http.get(
      Uri.parse(ApiConst.getUserSongs),
      headers: {'Content-Type': 'application/json', 'x-auth-token': token},
    );

    if (response.statusCode != 200) {
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      return Right(AppError(message: resBodyMap['detail']));
    }

    final jsonList = jsonDecode(response.body);

    return Left(jsonList.map((json) => SongModel.fromJson(jsonList)).toList());
  }

  Future<void> update() async {}
  Future<void> delete() async {}
}
