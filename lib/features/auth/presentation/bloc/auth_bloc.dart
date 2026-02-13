import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model.dart';
import '../../data/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial()) {
    on<AuthSignUpEvent>(_signUpEventHandler);

    on<AuthLoginEvent>(_loginEventHandler);
  }

  Future<void> _signUpEventHandler(
    AuthSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await authService.signup(
        name: event.name,
        email: event.email,
        password: event.password,
      );

      response.match(
        (userData) => emit(AuthSuccess(userData)),
        (error) => emit(AuthFailure(error.message)),
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _loginEventHandler(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await authService.login(
        email: event.email,
        password: event.password,
      );

      response.match(
        (userData) => emit(AuthSuccess(userData)),
        (error) => emit(AuthFailure(error.message)),
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
