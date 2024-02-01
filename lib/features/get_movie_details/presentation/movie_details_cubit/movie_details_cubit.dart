import 'package:appgain_task/features/get_movie_details/domain/usecases/movie_details_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/fuiluers.dart';
import '../../domain/entities/movie_details_response_entity.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase useCase;

  MovieDetailsCubit({required this.useCase}) : super(MovieDetailsInitial());

  Future<void> getMovieDetails({required int moveId}) async {
    final result = await useCase(moveId);

    emit(
      result.fold(
        (failure) => MovieDetailsError(
          msg: _mapFailureToMsg(failure),
        ),
        (success) => MovieDetailsLoaded(getMovieDetailsResponseEntity: success),
      ),
    );
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Error from server';
      default:
        return 'error';
    }
  }
}
