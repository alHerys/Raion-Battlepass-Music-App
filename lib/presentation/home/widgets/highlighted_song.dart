import 'package:flutter/material.dart';

import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';

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
