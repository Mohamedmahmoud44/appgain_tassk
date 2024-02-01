import 'package:equatable/equatable.dart';



class GetUpComingMoviesResponseEntity extends Equatable {
  final String? backdropPath;
  final String? posterPath;
  final String? originalTitle;
  final int id;

  const GetUpComingMoviesResponseEntity({
     this.backdropPath,
     this.originalTitle,
     required this.id,
     this.posterPath,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        originalTitle,
        id,
        posterPath,
      ];
}
