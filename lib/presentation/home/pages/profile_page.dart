import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
            var name = 'Name Placeholder';
            var email = 'Email Placeholder';

            if (state is AuthSuccess) {
              name = state.userData.name;
              email = state.userData.email;
            }

            return Column(
              mainAxisAlignment: .center,
              children: [
                Skeletonizer(
                  enabled: state is AuthLoading,
                  child: Column(
                    children: [
                      Text(name, style: AppText.headingSmall),
                      Text(
                        email,
                        style: AppText.caption.copyWith(
                          color: AppPallete.textGray,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 36),

                SizedBox(
                  width: 175,
                  child: ElevatedButton(
                    onPressed: state is AuthSuccess
                        ? () {
                            context.read<AuthBloc>().add(AuthLogoutEvent());
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPallete.red,
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(color: AppPallete.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
