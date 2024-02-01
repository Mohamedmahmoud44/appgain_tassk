part of 'get_movie_cubit.dart';

abstract class GetMovieState extends Equatable {
  const GetMovieState();

  @override
  List<Object> get props => [];
}

class GetMovieInitial extends GetMovieState {}

class GetMovieIsLoading extends GetMovieState {}

class GetMovieLoaded extends GetMovieState {
  final List<GetUpComingMoviesResponseEntity> upComingMovie;

  const GetMovieLoaded({required this.upComingMovie});

  @override
  List<Object> get props => [upComingMovie];
}

class GetMovieError extends GetMovieState {
  final String msg;

  const GetMovieError({required this.msg});

  @override
  List<Object> get props => [msg];
}
