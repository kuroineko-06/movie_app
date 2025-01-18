class ApiUrl {
  static const baseUrl =
      // 'http://192.168.79.23:3000/';
      'https://backendmovieapp-production-32eb.up.railway.app/';

  static const signup = 'api/v1/auth/signup';
  static const signin = 'api/v1/auth/signin';
  static const getUser = 'api/v1/auth/getuser/';
  static const editUser = 'api/v1/auth/edit/';

  static const trendingMovie = 'api/v1/movie/trending/';
  static const singleMovie = 'api/v1/movie/singlemovie/';
  static const seriesMovie = 'api/v1/movie/seriesmovie/';
  static const anime = 'api/v1/movie/anime/';

  static const getMovieDetail = 'api/v1/movie/details/';
  static const popularTv = 'api/v1/tv/popular/';
  static const search = 'api/v1/search/';
}
