import 'package:appgain_task/core/error/fuiluers.dart';
import 'package:appgain_task/core/use_case/use_case.dart';
import 'package:appgain_task/features/get_up_coming_movies/domain/entities/get_movie_entities.dart';
import 'package:appgain_task/features/get_up_coming_movies/domain/repositores/get_movie_repositores.dart';
import 'package:dartz/dartz.dart';


class GetUpComingMoviesUseCase implements UseCase<List<GetUpComingMoviesResponseEntity>,NoParams>
{
  final GetUpComingMoviesRepository upComingMoviesRepositories;

 const GetUpComingMoviesUseCase({required this.upComingMoviesRepositories});

  @override
  Future<Either<Failure, List<GetUpComingMoviesResponseEntity>>> call(NoParams params) =>upComingMoviesRepositories.getUpComingMovies();
}