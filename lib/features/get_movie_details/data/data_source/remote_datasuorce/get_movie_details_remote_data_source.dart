import 'package:appgain_task/core/api/api_consumr.dart';
import 'package:appgain_task/core/end_points/end_point.dart';
import 'package:flutter/material.dart';

import '../../models/movie_details_response_model.dart';

abstract class GetMovieDetailsBaseRemoteDatasource {
  Future<GetMovieDetailsResponseModel> getMoviesDetails({required int movieId});
}

class GetMovieDetailsRemoteDatasourceImpl
    implements GetMovieDetailsBaseRemoteDatasource {
  final ApiConsumer apiConsumer;

  GetMovieDetailsRemoteDatasourceImpl({required this.apiConsumer});

  @override
  Future<GetMovieDetailsResponseModel> getMoviesDetails(
      {required int movieId}) async {
    final Map<String, dynamic> getUpComingMoviesQueryParameters = {
      'api_key': EndPoint.apiKey,
      'language': EndPoint.language,
    };
    final response = await apiConsumer.get(
      EndPoint.movieDetails(movieId: movieId),
      queryParameters: getUpComingMoviesQueryParameters,
    );
    try {
      return GetMovieDetailsResponseModel.fromJson(response);
    } catch (e) {
      debugPrint('Error Get MovieDetails ${e.toString()}');
      rethrow;
    }
  }
}
