

import 'package:appgain_task/features/get_up_coming_movies/domain/entities/get_movie_entities.dart';

class GetUpComingMoviesResponseModel extends GetUpComingMoviesResponseEntity {
  const GetUpComingMoviesResponseModel({required super.id,super.backdropPath,
    super.posterPath,
    super.originalTitle,});

  factory GetUpComingMoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return GetUpComingMoviesResponseModel(
     id: json['id'],
        backdropPath : json['backdrop_path'],
        originalTitle : json['original_title'],
    posterPath : json['poster_path'],

    );
  }


}
