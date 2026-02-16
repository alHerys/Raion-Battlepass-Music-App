import 'package:flutter/material.dart';

import '../../../core/components/app_logo.dart';
import '../../../core/constants/image_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import '../widgets/highlighted_song.dart';
import '../widgets/song_card.dart';

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
