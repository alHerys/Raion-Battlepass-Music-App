import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import '../../../viewmodel/auth/auth_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 27),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Theme.of(
                context,
              ).colorScheme.onSecondaryContainer,
              child: Icon(Icons.info_outline, size: 20),
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('Alvianto Hery Sarborn', style: AppText.headingSmall),
            Text(
              'alfiantoherysarborn@gmail.com',
              style: AppText.caption.copyWith(color: AppPallete.textGray),
            ),

            SizedBox(height: 36),

            SizedBox(
              width: 175,
              child: ElevatedButton(
                onPressed: () =>
                    context.read<AuthBloc>().add(AuthLogoutEvent()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPallete.red,
                ),
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthInitial) {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushReplacementNamed('/auth');
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      'Logout',
                      style: TextStyle(color: AppPallete.white),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
