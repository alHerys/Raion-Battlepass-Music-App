import 'package:flutter/material.dart';
import '../../../core/constants/image_const.dart';
import '../../../core/theme/app_text.dart';

class SongCard extends StatefulWidget {
  final String title;
  final String artist;
  final String imagePath;

  const SongCard({
    super.key,
    required this.title,
    required this.artist,
    required this.imagePath,
  });

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      tileColor: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            ImageConst.thumbnail1,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text('Oakvale (From "Fable")', style: AppText.body),
      subtitle: Text('Ava Keys', style: AppText.songArtist),
      trailing: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          child: Icon(
            _isSelected ? Icons.pause : Icons.play_arrow,
            size: 30,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
