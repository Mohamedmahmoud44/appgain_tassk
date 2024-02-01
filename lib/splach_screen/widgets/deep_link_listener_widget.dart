import 'package:appgain_task/features/deep_link/controller/deep_link_controller/deep_link_cubit.dart';
import 'package:appgain_task/features/get_movie_details/presentation/screen/movie_details_screen.dart';
import 'package:appgain_task/features/get_up_coming_movies/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeepLinkListenerWidget extends StatelessWidget {
  const DeepLinkListenerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DeepLinkCubit, DeepLinkState>(listener: (context, state) {
          if (state is DeepLinkNavigationLoadedState) {
            debugPrint('kota');

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
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        })
      ],
      child: const SizedBox(),
    );
  }
}
