import 'package:appgain_task/core/error/exeption_error.dart';
import 'package:appgain_task/core/error/fuiluers.dart';
import 'package:appgain_task/features/get_up_coming_movies/data/data_source/remote_datasuorce/get_up_coming_movies_remote_datasuorce.dart';
import 'package:appgain_task/features/get_up_coming_movies/domain/entities/get_movie_entities.dart';
import 'package:appgain_task/features/get_up_coming_movies/domain/repositores/get_movie_repositores.dart';
import 'package:dartz/dartz.dart';
class GetUpComingMovieRepositoryImpl implements GetUpComingMoviesRepository {
  final GetUpComingMoviesBaseRemoteDatasource
      getUpComingMoviesBaseRemoteDatasource;

  const GetUpComingMovieRepositoryImpl(
      {required this.getUpComingMoviesBaseRemoteDatasource});

  @override
  Future<Either<Failure, List<GetUpComingMoviesResponseEntity>>> getUpComingMovies() async {
    try {
      final result = await getUpComingMoviesBaseRemoteDatasource.getUpComingMovies();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
