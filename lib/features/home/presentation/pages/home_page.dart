import 'package:flutter/material.dart';

import '../../../../core/components/app_logo.dart';
import '../../../../core/constants/image_path.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/app_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: double.infinity,
        backgroundColor: AppPallete.transparent,
        leading: AppLogo(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              HighlightedSong(
                thumbnailPath: ImagePath.thumbnail2,
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
                    ImagePath.thumbnail1,
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

class HighlightedSong extends StatelessWidget {
  final String thumbnailPath;
  final String songTitle;
  final String songArtist;
  final VoidCallback onTap;
  final VoidCallback playButton;
  final VoidCallback favoriteButton;
  final VoidCallback playlistButton;

  const HighlightedSong({
    super.key,
    required this.thumbnailPath,
    required this.songTitle,
    required this.songArtist,
    required this.onTap,
    required this.playButton,
    required this.favoriteButton,
    required this.playlistButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 353,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(thumbnailPath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text('Today\'s for\nYou', style: AppText.headingMedium),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  songTitle,
                  style: AppText.body.copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  songArtist,
                  style: AppText.songArtist.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 19),

                Row(
                  spacing: 8,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 1,
                        bottom: 1,
                        left: 5,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(43),
                      ),
                      child: Row(
                        spacing: 4,
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                          Text(
                            'Play Now',
                            style: AppText.bodySmall.copyWith(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ],
                      ),
                    ),

                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.onSecondaryContainer,
                      child: Icon(
                        Icons.favorite_rounded,
                        color: AppPallete.red,
                        size: 20,
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.onSecondaryContainer,
                      child: Icon(Icons.playlist_add_rounded, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
