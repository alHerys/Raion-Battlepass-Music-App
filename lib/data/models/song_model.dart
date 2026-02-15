import 'dart:convert';

class SongModel {
  final String songUrl;
  final String artist;
  final String uploaderId;
  final String id;
  final String thumbnailUrl;
  final String title;

  SongModel({
    required this.songUrl,
    required this.artist,
    required this.uploaderId,
    required this.id,
    required this.thumbnailUrl,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'songUrl': songUrl,
      'artist': artist,
      'uploaderId': uploaderId,
      'id': id,
      'thumbnailUrl': thumbnailUrl,
      'title': title,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      songUrl: map['songUrl'] as String,
      artist: map['artist'] as String,
      uploaderId: map['uploaderId'] as String,
      id: map['id'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongModel.fromJson(String source) =>
      SongModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
