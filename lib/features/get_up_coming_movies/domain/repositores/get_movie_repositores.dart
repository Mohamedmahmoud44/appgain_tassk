import 'package:dartz/dartz.dart';

import '../../../../core/error/fuiluers.dart';
import '../entities/get_movie_entities.dart';


abstract class GetUpComingMoviesRepository{


  Future<Either<Failure,List<GetUpComingMoviesResponseEntity>>>getUpComingMovies();

}