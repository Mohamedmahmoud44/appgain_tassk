import 'package:appgain_task/core/end_points/end_point.dart';
import 'package:appgain_task/features/get_movie_details/domain/entities/movie_details_response_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utiles/app_colors.dart';

class MovieDetailsBody extends StatelessWidget {
  final GetMovieDetailsResponseEntity model;
  const MovieDetailsBody({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          Container(
            width: double.infinity,
            height: 400.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.r),
              child: CachedNetworkImage(
                imageUrl: '${EndPoint.imagePath}${model.backdropPath}',
                fit: BoxFit.cover,
              )
            ),
          ),
          Text(
            model.originalTitle??'',
            style: TextStyle(
              height: 2,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.hint,
            ),
          ),
           SizedBox(height: 10.h,),
          Expanded(
            child: Container(
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.r),
                    topLeft: Radius.circular(40.r),
                  ),
                  color: Colors.amber),
              padding: const EdgeInsets.all(20),
              child: Text(

                model.overview??'no title',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  height: 2,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.hint,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
