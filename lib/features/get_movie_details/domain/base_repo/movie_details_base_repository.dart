import 'package:dartz/dartz.dart';

import '../../../../core/error/fuiluers.dart';
import '../entities/movie_details_response_entity.dart';


abstract class GetMovieDetailsRepository{


  Future<Either<Failure,GetMovieDetailsResponseEntity>>getMovieDetails({required int movieId});


}