import 'package:appgain_task/core/utiles/app_colors.dart';
import 'package:appgain_task/core/utiles/app_strings.dart';
import 'package:appgain_task/features/deep_link/controller/deep_link_controller/deep_link_cubit.dart';
import 'package:appgain_task/features/get_movie_details/presentation/screen/movie_details_screen.dart';
import 'package:appgain_task/features/get_up_coming_movies/presentation/get_movie_cubit/get_movie_cubit.dart';
import 'package:appgain_task/features/get_up_coming_movies/presentation/widgets/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appgain_task/injection_containar.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<GetMovieCubit>()..getUpComingMovieData(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            AppStrings.appName,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.hint),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<GetMovieCubit, GetMovieState>(
                builder: (context, state) {
                  if (state is GetMovieIsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetMovieError) {
                    return const Center(child: Text('have a probleb'));
                  } else if (state is GetMovieLoaded) {
                    return GridViewCon(
                      upComingMovies: state.upComingMovie,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            MultiBlocListener(
              listeners: [
                BlocListener<DeepLinkCubit, DeepLinkState>(
                    listener: (context, state) {
                  if (state is DeepLinkNavigationLoadedState) {
                    debugPrint('The Movie Id From State Is ${state.movieId}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(
                          movieId: state.movieId,
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                })
              ],
              child: const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
//GridViewCon()
