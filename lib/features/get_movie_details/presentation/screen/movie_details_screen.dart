import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utiles/app_colors.dart';
import '../../../../core/utiles/app_strings.dart';
import 'package:appgain_task/injection_containar.dart' as di;

import '../movie_details_cubit/movie_details_cubit.dart';
import 'widgets/movie_details_body.dart';



class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieId});
final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>di.sl<MovieDetailsCubit>()..getMovieDetails(moveId: movieId),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            AppStrings.movieDetails,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.hint),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<MovieDetailsCubit,MovieDetailsState>(
          builder: (context,state){
            if(state is MovieDetailsIsLoading){
              return const Center(child: CircularProgressIndicator());
            }else if(state is MovieDetailsError)
            {
              return const Center(child: Text('have a probleb'));
            }else if(state is MovieDetailsLoaded){
              return MovieDetailsBody(model: state.getMovieDetailsResponseEntity,);
            }else {
              return const Center(child: CircularProgressIndicator());
            }
        },
        )
      ),
    );
  }
}
