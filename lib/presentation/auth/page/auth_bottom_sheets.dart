import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_text.dart';
import '../../../core/validator/auth_validator.dart';
import '../../../viewmodel/auth/auth_bloc.dart';
import '../widget/auth_button.dart';
import '../widget/custom_field.dart';
import '../widget/error_message_container.dart';

class AuthBottomSheets {
  static Future loginBottomSheet({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController nameController,
    required TextEditingController confirmPasswordController,
    required VoidCallback loginButton,
    required VoidCallback signUpButton,
  }) {
    final formKey = GlobalKey<FormState>();
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return Form(
          key: formKey,
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 32,
                  bottom: 16 + MediaQuery.viewInsetsOf(context).bottom * 0.6,
                ),
                child: Column(
                  crossAxisAlignment: .stretch,
                  mainAxisAlignment: .spaceBetween,
                  spacing: 100,
                  children: [
                    Column(
                      spacing: 15,
                      children: [
                        CustomField(
                          controller: emailController,
                          hintText: 'name@example.com',
                          labelText: 'Email',
                          validator: (value) =>
                              AuthValidator.email(value: value),
                        ),
                        CustomField(
                          controller: passwordController,
                          hintText: 'Your Password',
                          labelText: 'Password',
                          isObscure: true,
                          validator: (value) =>
                              AuthValidator.password(value: value),
                        ),
                      ],
                    ),
                    SafeArea(
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return LinearProgressIndicator();
                          }

                          return Column(
                            spacing: 15,
                            crossAxisAlignment: .stretch,
                            children: [
                              if (state is AuthFailure)
                                ErrorMessageContainer(state.message),

                              AuthButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    loginButton();
                                  }
                                },
                                buttonText: 'Login',
                                buttonTextColor: Theme.of(
                                  context,
                                ).colorScheme.onPrimary,
                                buttonBgColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                richText: RichText(
                                  textAlign: .center,
                                  text: TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: AppText.caption.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Sign Up',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pop(context);
                                            nameBottomSheet(
                                              context: context,
                                              nameController: nameController,
                                              emailController: emailController,
                                              passwordController:
                                                  passwordController,
                                              confirmPasswordController:
                                                  confirmPasswordController,
                                              loginButton: loginButton,
                                              signUpButton: signUpButton,
                                            );
                                          },
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future signUpBottomSheet({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required VoidCallback signUpButton,
  }) {
    final formKey = GlobalKey<FormState>();
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return Form(
          key: formKey,
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 32,
                  bottom: 16 + MediaQuery.viewInsetsOf(context).bottom * 0.6,
                ),
                child: Column(
                  crossAxisAlignment: .stretch,
                  mainAxisAlignment: .spaceBetween,
                  spacing: 36,
                  children: [
                    Column(
                      spacing: 15,
                      children: [
                        CustomField(
                          controller: emailController,
                          hintText: 'name@example.com',
                          labelText: 'Email',
                          validator: (value) =>
                              AuthValidator.email(value: value),
                        ),
                        CustomField(
                          controller: passwordController,
                          hintText: 'Your Password',
                          labelText: 'Password',
                          isObscure: true,
                          validator: (value) =>
                              AuthValidator.password(value: value),
                        ),
                        CustomField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm Your Password',
                          labelText: 'Confirm Password',
                          isObscure: true,
                          validator: (value) => AuthValidator.confirmPassword(
                            password: passwordController.text,
                            confirmPassword: value,
                          ),
                        ),
                      ],
                    ),

                    SafeArea(
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            print(state.userData);
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return LinearProgressIndicator();
                          }

                          return Column(
                            spacing: 15,
                            crossAxisAlignment: .stretch,
                            children: [
                              if (state is AuthFailure)
                                ErrorMessageContainer(state.message),

                              AuthButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    signUpButton();
                                  }
                                },
                                buttonText: 'Sign Up',
                                buttonTextColor: Theme.of(
                                  context,
                                ).colorScheme.onPrimary,
                                buttonBgColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                richText: RichText(
                                  textAlign: .center,
                                  maxLines: 2,
                                  text: TextSpan(
                                    text:
                                        'By continuing, you agree to RaionME\'s ',
                                    style: AppText.caption.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            'Conditions of Use and Privacy Notice',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future nameBottomSheet({
    required BuildContext context,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required VoidCallback signUpButton,
    required VoidCallback loginButton,
  }) {
    final formKey = GlobalKey<FormState>();

    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: true,
      isScrollControlled: true,
      builder: (context) {
        return Form(
          key: formKey,
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 32,
                  bottom: 16 + MediaQuery.viewInsetsOf(context).bottom * 0.6,
                ),
                child: Column(
                  crossAxisAlignment: .stretch,
                  mainAxisAlignment: .spaceBetween,
                  spacing: 50,
                  children: [
                    CustomField(
                      controller: nameController,
                      hintText: 'Your Name',
                      labelText: 'Name',
                      validator: (value) => AuthValidator.name(value: value),
                    ),

                    SafeArea(
                      child: AuthButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            Navigator.pop(context);
                            signUpBottomSheet(
                              context: context,
                              emailController: emailController,
                              passwordController: passwordController,
                              confirmPasswordController:
                                  confirmPasswordController,
                              signUpButton: signUpButton,
                            );
                          }
                        },
                        buttonText: 'Next',
                        buttonTextColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                        buttonBgColor: Theme.of(context).colorScheme.primary,
                        richText: RichText(
                          textAlign: .center,
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: AppText.caption.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            children: [
                              TextSpan(
                                text: 'Login',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                    loginBottomSheet(
                                      context: context,
                                      emailController: emailController,
                                      passwordController: passwordController,
                                      nameController: nameController,
                                      loginButton: loginButton,
                                      confirmPasswordController:
                                          confirmPasswordController,
                                      signUpButton: signUpButton,
                                    );
                                  },
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
