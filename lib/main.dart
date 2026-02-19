import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/theme/app_theme.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/song_repository.dart';
import 'data/services/hive_storage_service.dart';
import 'presentation/auth/page/auth_onboarding_page.dart';
import 'presentation/song/pages/song_player_page.dart';
import 'presentation/song/pages/upload_page.dart';
import 'viewmodel/auth/auth_bloc.dart';
import 'presentation/home/pages/root_page.dart';
import 'presentation/splash/splash_page.dart';
import 'viewmodel/song/song_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive Local Storage
  await Hive.initFlutter();
  await HiveStorageService().initBox();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),

        RepositoryProvider<SongRepository>(
          create: (context) => SongRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(context.read<AuthRepository>())
                  ..add(AuthCheckTokenEvent()),
          ),
          BlocProvider(
            create: (context) => SongBloc(context.read<SongRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.darkTheme,
          themeMode: .dark,
          initialRoute: '/',
          routes: {
            '/': (_) => SplashPage(),
            '/auth': (_) => AuthOnboardingPage(),
            '/home': (_) => RootPage(),
            '/play': (_) => SongPlayerPage(),
            '/upload': (_) => UploadPage(),
          },
        ),
      ),
    );
  }
}
