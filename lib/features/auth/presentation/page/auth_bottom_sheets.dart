import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text.dart';
import '../../../../core/validator/auth_validator.dart';
import '../widget/auth_button.dart';
import '../widget/custom_field.dart';

class AuthBottomSheets {
  static Future loginBottomSheet({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController nameController,
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
                              AuthValidator.name(value: value),
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
                      child: AuthButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            loginButton();
                          }
                        },
                        buttonText: 'Login',
                        buttonTextColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                        buttonBgColor: Theme.of(context).colorScheme.primary,
                        richText: RichText(
                          textAlign: .center,
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: AppText.caption.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
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
                                      passwordController: passwordController,
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

  static Future signUpBottomSheet({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
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
                          controller: TextEditingController(),
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
                      child: AuthButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            signUpButton();
                          }
                        },
                        buttonText: 'Sign Up',
                        buttonTextColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                        buttonBgColor: Theme.of(context).colorScheme.primary,
                        richText: RichText(
                          textAlign: .center,
                          maxLines: 2,
                          text: TextSpan(
                            text: 'By continuing, you agree to RaionME\'s ',
                            style: AppText.caption.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            children: [
                              TextSpan(
                                text: 'Conditions of Use and Privacy Notice',
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
    required VoidCallback signUpButton,
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
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pop(context);
                            signUpBottomSheet(
                              context: context,
                              emailController: emailController,
                              passwordController: passwordController,
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
                                      loginButton: signUpButton,
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
