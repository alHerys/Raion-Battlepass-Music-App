import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../core/theme/app_pallete.dart';
import '../../../viewmodel/song/song_bloc.dart';
import 'home_page.dart';
import 'profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    context.read<SongBloc>().add(GetAllSongEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SongBloc, SongState>(
      listener: (context, state) {
        if (state is SongLoading) {
          print('Loading');
        }

        if (state is GetSongSuccess) {
          for (var song in state.songs) {
            print(song);
          }
        }

        if (state is SongFailure) {
          print(state.message);
        }
      },
      child: PersistentTabView(
        backgroundColor: AppPallete.backgroundBlack,
        tabs: [
          PersistentTabConfig(
            screen: HomePage(),
            item: ItemConfig(
              icon: Icon(Icons.home_filled),
              title: 'Home',
              activeForegroundColor: AppPallete.yellow,
            ),
          ),
          PersistentTabConfig(
            screen: ProfilePage(),
            item: ItemConfig(
              icon: Icon(Icons.person),
              title: 'Profile',
              activeForegroundColor: AppPallete.yellow,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) {
          return Style12BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: NavBarDecoration(
              color: AppPallete.backgroundBlack,
            ),
          );
        },
      ),
    );
  }
}
