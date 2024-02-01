class EndPoint{

  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String upcomingMovies = '${baseUrl}movie/upcoming';
  static const String imagePath = 'https://image.tmdb.org/t/p/original';
  static  String movieDetails({required int movieId}) => '${baseUrl}movie/$movieId';
  static const String language = 'en-US';
  static const int pageNumber = 1;


  static const String apiKey = '996535b8275908c0edcc03e2fb9c62df';
}