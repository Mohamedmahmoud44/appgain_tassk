import 'package:appgain_task/core/use_case/use_case.dart';
import 'package:appgain_task/features/get_up_coming_movies/domain/entities/get_movie_entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/fuiluers.dart';
import '../../domain/usecases/get_movie_use_case.dart';

part 'get_movie_state.dart';

class GetMovieCubit extends Cubit<GetMovieState> {
  final GetUpComingMoviesUseCase getMovieDataUseCase;

  GetMovieCubit({required this.getMovieDataUseCase}) : super(GetMovieInitial());

  Future<void> getUpComingMovieData() async {
    final result = await getMovieDataUseCase(NoParams());

    emit(
      result.fold((failure) => GetMovieError(msg: _mapFailureToMsg(failure)),
          (success) => GetMovieLoaded(upComingMovie: success)),
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
