import 'package:appgain_task/features/get_up_coming_movies/domain/entities/get_movie_entities.dart';
import 'package:flutter/material.dart';

import 'card_iteam.dart';

class GridViewCon extends StatelessWidget {
  final List<GetUpComingMoviesResponseEntity>upComingMovies;
  const GridViewCon({super.key, required this.upComingMovies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/3.5,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: upComingMovies.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index)=> MovieItem(model:upComingMovies[index] ),

    );
  }
}
