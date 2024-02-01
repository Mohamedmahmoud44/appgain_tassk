import 'package:equatable/equatable.dart';

class GetMovieDetailsResponseEntity extends Equatable{

  final String? backdropPath;
  final String? overview;
  final String? originalTitle;
  final int? id;


  const GetMovieDetailsResponseEntity({
    required this.overview,
    required this.originalTitle,
    required this.backdropPath,
    required this.id,
});

  @override
  List<Object?> get props =>[
    overview,
    originalTitle,
    backdropPath,
    id,
  ];
}