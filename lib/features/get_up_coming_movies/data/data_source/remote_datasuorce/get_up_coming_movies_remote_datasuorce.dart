import 'package:appgain_task/core/api/api_consumr.dart';
import 'package:appgain_task/core/end_points/end_point.dart';
import 'package:flutter/material.dart';

import '../../models/movie_model.dart';

abstract class  GetUpComingMoviesBaseRemoteDatasource
{
Future<List<GetUpComingMoviesResponseModel>> getUpComingMovies();
}


class GetUpComingMoviesRemoteDatasourceImpl implements GetUpComingMoviesBaseRemoteDatasource{
  final ApiConsumer apiConsumer;

  GetUpComingMoviesRemoteDatasourceImpl({required this.apiConsumer});

  @override
  Future<List<GetUpComingMoviesResponseModel>> getUpComingMovies()async {
    final Map<String,dynamic>getUpComingMoviesQueryParameters ={
      'api_key':EndPoint.apiKey,
     'language': EndPoint.language,
     'page': EndPoint.pageNumber,
    };
    final response = await apiConsumer.get(
      EndPoint.upcomingMovies,
        queryParameters:getUpComingMoviesQueryParameters,
    );
    final List<dynamic> responseJson=response['results'];
    try {
     return  responseJson.map((e) =>GetUpComingMoviesResponseModel.fromJson(e as Map<String,dynamic>),).toList();
    }catch(e){
      debugPrint('Error From Get UpComing Movies Remote Data Source ${e.toString()}');
      rethrow;
    }
  }
}