// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      songUrl: map['song_url'] as String,
      artist: map['artist'] as String,
      uploaderId: map['user_id'] as String,
      id: map['id'] as String,
      thumbnailUrl: map['thumbnail_url'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  static List<SongModel> fromJsonList(String source) {
    final list = json.decode(source) as List;
    return list
        .map((json) => SongModel.fromMap(json as Map<String, dynamic>))
        .toList();
  }

  @override
  String toString() {
    return 'SongModel(songUrl: $songUrl, artist: $artist, uploaderId: $uploaderId, id: $id, thumbnailUrl: $thumbnailUrl, title: $title)';
  }
}
