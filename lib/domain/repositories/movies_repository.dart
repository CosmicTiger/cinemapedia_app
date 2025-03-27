import 'package:cinemapedia_app/domain/entities/movie.dart';

abstract class MoviesRepository {
  /// NOTE: Reminder: Repository always calls out DataSource. That's why both should have the same methods.
  /// Because the DataSource is just simply put the informational Provider that I'm using but the Repository is the
  /// element in charge to decide which DataSource is going to use to get that given provider.
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});

  Future<Movie> getMovieById(String id);

  Future<List<Movie>> searchMovies(String query);

  Future<List<Movie>> getSimilarMovies(int movieId);

  Future<List<String>> getYoutubeVideosById(int movieId);
}
