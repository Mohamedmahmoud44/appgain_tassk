import 'package:appgain_task/features/get_movie_details/data/data_source/remote_datasuorce/get_movie_details_remote_data_source.dart';
import 'package:appgain_task/features/get_movie_details/data/repositores/get_movie_details_repo_impl.dart';
import 'package:appgain_task/features/get_movie_details/domain/base_repo/movie_details_base_repository.dart';
import 'package:appgain_task/features/get_movie_details/domain/usecases/movie_details_use_case.dart';
import 'package:appgain_task/features/get_movie_details/presentation/movie_details_cubit/movie_details_cubit.dart';
import 'package:appgain_task/features/get_up_coming_movies/data/data_source/remote_datasuorce/get_up_coming_movies_remote_datasuorce.dart';
import 'package:appgain_task/features/get_up_coming_movies/data/repositores/get_movie_repo_impl.dart';
import 'package:appgain_task/features/get_up_coming_movies/domain/repositores/get_movie_repositores.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/api/api_consumr.dart';
import 'core/api/dio_consumer.dart';
import 'core/api/interceptors.dart';
import 'features/get_up_coming_movies/domain/usecases/get_movie_use_case.dart';
import 'features/get_up_coming_movies/presentation/get_movie_cubit/get_movie_cubit.dart';

final sl = GetIt.instance;

Future<void> initInjectionContainer() async {
  //blocs

  sl.registerFactory(() => GetMovieCubit(getMovieDataUseCase: sl()));
  sl.registerFactory(() => MovieDetailsCubit(useCase: sl()));

  //use cases

  sl.registerLazySingleton(
      () => GetUpComingMoviesUseCase(upComingMoviesRepositories: sl()));
  sl.registerLazySingleton(
      () => GetMovieDetailsUseCase(getMovieDetailsRepository: sl()));

  //repositories

  sl.registerLazySingleton<GetUpComingMoviesRepository>(
    () => GetUpComingMovieRepositoryImpl(
      getUpComingMoviesBaseRemoteDatasource: sl(),
    ),
  );
  sl.registerLazySingleton<GetMovieDetailsRepository>(
      () => GetMovieDetailsRepositoryImpl(
            moviesDetailsBaseRemoteDatasource: sl(),
          ));

  //dataSources
  sl.registerLazySingleton<GetUpComingMoviesBaseRemoteDatasource>(
    () => GetUpComingMoviesRemoteDatasourceImpl(
      apiConsumer: sl(),
    ),
  );
  sl.registerLazySingleton<GetMovieDetailsBaseRemoteDatasource>(
    () => GetMovieDetailsRemoteDatasourceImpl(
      apiConsumer: sl(),
    ),
  );

  //////core

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  /////// external

  ///final sharedPreferences = await SharedPreferences.getInstance();
  ///sl.registerLazySingleton(() => sharedPreferences);
  ///sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ));
  sl.registerLazySingleton(() => Dio());
}
