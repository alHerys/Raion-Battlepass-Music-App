import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/storage_const.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/services/hive_storage_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthSignUpEvent>(_signUpEventHandler);
    on<AuthLoginEvent>(_loginEventHandler);
    on<AuthCheckTokenEvent>(_checkTokenEventHandler);
    on<AuthLogoutEvent>(_logoutEventHandler);
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
          final hive = HiveStorageService();
          hive.save<UserModel>(
            boxName: StorageConst.userHiveBox,
            boxKey: StorageConst.userHiveKey,
            value: userData,
          );

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

  Future<void> _logoutEventHandler(
    AuthLogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final hive = HiveStorageService();

    try {
      hive.delete<UserModel>(
        boxName: StorageConst.userHiveBox,
        boxKey: StorageConst.userHiveKey,
      );

      emit(AuthInitial());
    } catch (e) {
      return;
    }
  }

  Future<void> _checkTokenEventHandler(
    AuthCheckTokenEvent event,
    Emitter<AuthState> emit,
  ) async {
    final hive = HiveStorageService();
    final user = await hive.read<UserModel>(
      boxName: StorageConst.userHiveBox,
      boxKey: StorageConst.userHiveKey,
    );

    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(AuthInitial());
    }
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);

    print(transition);
  }
}
