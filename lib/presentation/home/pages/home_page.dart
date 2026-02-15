import 'package:flutter/material.dart';

import '../../../core/components/app_logo.dart';
import '../../../core/constants/image_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import '../widgets/highlighted_song.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppPallete.transparent,
        elevation: 0,
        leadingWidth: .infinity,
        backgroundColor: AppPallete.transparent,
        leading: AppLogo(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .all(20),
            child: Column(
              crossAxisAlignment: .stretch,
              spacing: 10,
              children: [
                HighlightedSong(
                  thumbnailPath: ImageConst.thumbnail2,
                  songTitle: 'Ghibli Melodies',
                  songArtist: 'by Studio Ghibli',
                  onTap: () {},
                  playButton: () {},
                  favoriteButton: () {},
                  playlistButton: () {},
                ),

                Padding(
                  padding: const .only(top: 34, bottom: 10),
                  child: Text('Other Songs', style: AppText.bodyLarge),
                ),

                ...List.generate(5, (int index) => SongCard()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SongCard extends StatefulWidget {
  const SongCard({super.key});

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
