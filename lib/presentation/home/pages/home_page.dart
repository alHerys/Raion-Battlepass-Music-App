import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/components/app_logo.dart';
import '../../../core/constants/image_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import '../../../data/models/song_model.dart';
import '../../../viewmodel/song/song_bloc.dart';
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
            child: BlocBuilder<SongBloc, SongState>(
              builder: (context, state) {
                var songsData = List.empty();

                if (state is SongLoading) {
                  songsData = List.filled(
                    5,
                    SongModel(
                      songUrl: '',
                      artist: 'Artist',
                      uploaderId: '',
                      id: '',
                      thumbnailUrl: '',
                      title: 'Song Title',
                    ),
                  );
                }

                if (state is GetSongSuccess) {
                  songsData = state.songs;
                }

                return Column(
                  crossAxisAlignment: .stretch,
                  spacing: 10,
                  children: [
                    Skeletonizer(
                      enabled: switch (state) {
                        SongLoading() => true,
                        _ => false,
                      },
                      child: HighlightedSong(
                        thumbnailPath: ImageConst.thumbnail2,
                        songTitle: 'Ghibli Melodies',
                        songArtist: 'by Studio Ghibli',
                        onTap: () {},
                        playButton: () {},
                        favoriteButton: () {},
                        playlistButton: () {},
                      ),
                    ),

                    Padding(
                      padding: const .only(top: 34, bottom: 10),
                      child: Text('Other Songs', style: AppText.bodyLarge),
                    ),

                    Skeletonizer(
                      enabled: switch (state) {
                        SongLoading() => true,
                        _ => false,
                      },
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: ScrollPhysics(
                          parent: NeverScrollableScrollPhysics(),
                        ),
                        itemCount: songsData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SongCard(
                            title: songsData[index].title,
                            artist: songsData[index].artist,
                            imagePath: songsData[index].thumbnailUrl.isNotEmpty
                                ? songsData[index].thumbnailUrl
                                : null,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 15);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
