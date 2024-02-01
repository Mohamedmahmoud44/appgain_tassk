part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}
class MovieDetailsIsLoading extends MovieDetailsState {
}
class MovieDetailsLoaded extends MovieDetailsState {
  final GetMovieDetailsResponseEntity getMovieDetailsResponseEntity;

  const MovieDetailsLoaded({required this.getMovieDetailsResponseEntity});

  @override
  List<Object> get props => [getMovieDetailsResponseEntity];

}
class MovieDetailsError extends MovieDetailsState {
  final String msg;

  const MovieDetailsError({required this.msg});

  @override
  List<Object> get props => [msg];
}
