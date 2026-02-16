class ApiConst {
  ApiConst._(); // membuat class ini tidak akan pernah diinstansiasi

  static const String _baseUrl =
      "https://music-app-server-production-e7ea.up.railway.app";
  static const String signup = '$_baseUrl/auth/signup';
  static const String login = '$_baseUrl/auth/login';
  static const String currentUser = '$_baseUrl/auth/';
  static const String uploadSong = '$_baseUrl/songs/upload';
  static const String getAllSong = '$_baseUrl/songs/getall';
  static const String getUserSongs = '$_baseUrl/songs/me';

  static String updateSong({required String id}) =>
      '$_baseUrl/songs/upload/$id';
  static String deleteSong({required String id}) =>
      '$_baseUrl/songs/delete/$id';

  static Map<String, String> authTokenHeader({required String token}) => {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
}
