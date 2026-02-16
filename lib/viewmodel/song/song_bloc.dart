import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/storage_const.dart';
import '../../data/models/song_model.dart';
import '../../data/repositories/song_repository.dart';
import '../../data/services/secure_storage_service.dart';

sealed class SongEvent {}

final class GetAllSongEvent extends SongEvent {}

final class GetMySongEvent extends SongEvent {}

final class UploadSongEvent extends SongEvent {}

final class UpdateSongEvent extends SongEvent {}

final class DeleteSongEvent extends SongEvent {}

//* -------------------------------------------------------------------------------

sealed class SongState {}

final class SongInitial extends SongState {}

final class GetSongSuccess extends SongState {
  final List<SongModel> songs;

  GetSongSuccess(this.songs);
}

final class SongFailure extends SongState {
  final String message;

  SongFailure(this.message);
}

final class SongLoading extends SongState {}

//* -------------------------------------------------------------------------------

class SongBloc extends Bloc<SongEvent, SongState> {
  final SongRepository _songRepository;
  SongBloc(this._songRepository) : super(SongInitial()) {
    on<GetAllSongEvent>(_getAllSongHandler);
    on<GetMySongEvent>(_getMySongHandler);
  }

  Future<void> _getAllSongHandler(
    GetAllSongEvent event,
    Emitter<SongState> emit,
  ) async {
    emit(SongLoading());
    try {
      final response = await _songRepository.getall();

      return response.match(
        (songs) => emit(GetSongSuccess(songs)),
        (error) => emit(SongFailure(error.message)),
      );
    } catch (e) {
      return emit(SongFailure('get all song error: ${e.toString()}'));
    }
  }

  Future<void> _getMySongHandler(
    GetMySongEvent event,
    Emitter<SongState> emit,
  ) async {
    emit(SongLoading());
    try {
      final secureStorage = SecureStorageService();
      final token = await secureStorage.read(key: StorageConst.jwtStorageKey);

      final response = await _songRepository.getMySong(token!);

      return response.match(
        (songs) => emit(GetSongSuccess(songs)),
        (error) => emit(SongFailure(error.message)),
      );
    } catch (e) {
      emit(SongFailure('get my song error: ${e.toString()}'));
    }
  }

  @override
  void onTransition(Transition<SongEvent, SongState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
