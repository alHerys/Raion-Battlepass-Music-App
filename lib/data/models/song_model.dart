import 'dart:convert';

import 'package:hive/hive.dart';

part 'song_model.g.dart';

@HiveType(typeId: 1)
class SongModel {
  @HiveField(0)
  final String songUrl;
  @HiveField(1)
  final String artist;
  @HiveField(2)
  final String uploaderId;
  @HiveField(3)
  final String id;
  @HiveField(4)
  final String thumbnailUrl;
  @HiveField(5)
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
