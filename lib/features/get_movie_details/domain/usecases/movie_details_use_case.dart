import 'package:appgain_task/core/error/fuiluers.dart';
import 'package:appgain_task/core/use_case/use_case.dart';
import 'package:appgain_task/features/get_movie_details/domain/base_repo/movie_details_base_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/movie_details_response_entity.dart';

class GetMovieDetailsUseCase implements UseCase<GetMovieDetailsResponseEntity, int> {
  final GetMovieDetailsRepository getMovieDetailsRepository;

  const GetMovieDetailsUseCase({required this.getMovieDetailsRepository});

  @override
  Future<Either<Failure, GetMovieDetailsResponseEntity>> call(int moveId) =>
      getMovieDetailsRepository.getMovieDetails(movieId: moveId);
}
