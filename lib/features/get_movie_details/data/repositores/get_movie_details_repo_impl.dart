import 'package:appgain_task/core/error/exeption_error.dart';
import 'package:appgain_task/core/error/fuiluers.dart';
import 'package:appgain_task/features/get_movie_details/domain/base_repo/movie_details_base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/movie_details_response_entity.dart';
import '../data_source/remote_datasuorce/get_movie_details_remote_data_source.dart';

class GetMovieDetailsRepositoryImpl implements GetMovieDetailsRepository {
  final GetMovieDetailsBaseRemoteDatasource
      moviesDetailsBaseRemoteDatasource;

  const GetMovieDetailsRepositoryImpl(
      {required this.moviesDetailsBaseRemoteDatasource});


  @override
  Future<Either<Failure, GetMovieDetailsResponseEntity>> getMovieDetails({required int movieId})async {
    try {
      final result = await moviesDetailsBaseRemoteDatasource.getMoviesDetails(movieId: movieId);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }  }
}
