
import '../../domain/entities/movie_details_response_entity.dart';

class GetMovieDetailsResponseModel extends GetMovieDetailsResponseEntity {
   GetMovieDetailsResponseModel({
    required super.backdropPath,
   required super.overview,
   required super.originalTitle,
    required super.id,
  });

  factory GetMovieDetailsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return GetMovieDetailsResponseModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      originalTitle: json['original_title'],
    );
  }
}
