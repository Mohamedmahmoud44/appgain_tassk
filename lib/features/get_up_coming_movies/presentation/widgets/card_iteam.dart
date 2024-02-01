import 'package:appgain_task/core/utiles/app_colors.dart';
import 'package:appgain_task/features/get_movie_details/presentation/screen/movie_details_screen.dart';
import 'package:appgain_task/features/get_up_coming_movies/domain/entities/get_movie_entities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/end_points/end_point.dart';

class MovieItem extends StatelessWidget {
  final GetUpComingMoviesResponseEntity model;

  const MovieItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
              movieId: model.id,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin:  const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r), color: Colors.black),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: CachedNetworkImage(
                  imageUrl: '${EndPoint.imagePath}${model.backdropPath ?? ''}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            model.originalTitle ?? '',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.hint,
            ),
          ),
        ],
      ),
    );
  }
}
