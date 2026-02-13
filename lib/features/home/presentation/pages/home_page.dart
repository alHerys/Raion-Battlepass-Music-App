import 'package:flutter/material.dart';

import '../../../../core/components/app_logo.dart';
import '../../../../core/constants/image_const.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/app_text.dart';
import '../widgets/highlighted_song.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: .infinity,
        backgroundColor: AppPallete.transparent,
        leading: AppLogo(),
      ),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: ListView(
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
                padding: const .only(top: 34),
                child: Text('Other Songs', style: AppText.bodyLarge),
              ),
              ListTile(
                onTap: () {},
                tileColor: Theme.of(context).colorScheme.primaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    ImageConst.thumbnail1,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text('Oakvale (From "Fable")', style: AppText.body),
                subtitle: Text('Ava Keys', style: AppText.songArtist),
                trailing: CircleAvatar(
                  radius: 18,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer,
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 30,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
