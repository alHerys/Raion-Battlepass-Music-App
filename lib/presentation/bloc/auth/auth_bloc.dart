import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../data/services/secure_storage_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthSignUpEvent>(_signUpEventHandler);
    on<AuthLoginEvent>(_loginEventHandler);
  }

  Future<void> _signUpEventHandler(
    AuthSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await _authRepository.signup(
        name: event.name,
        email: event.email,
        password: event.password,
      );

      return response.match(
        (userData) => emit(AuthSuccess(userData)),
        (error) => emit(AuthFailure(error.message)),
      );
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _loginEventHandler(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await _authRepository.login(
        email: event.email,
        password: event.password,
      );

      return response.match(
        (userData) {
          emit(AuthSuccess(userData));
        },
        (error) {
          emit(AuthFailure(error.message));
        },
      );
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _checkTokenEvent(
    AuthCheckToken event,
    Emitter<AuthState> emit,
  ) async {
    final secureStorage = SecureStorageService();

    // final token = await secureStorage.read();

    // if (token != null) {
    //   emit(AuthSuccess(userData));
    // } else {
    //   emit(AuthInitial());
    // }
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);

    print(transition);
  }
}
