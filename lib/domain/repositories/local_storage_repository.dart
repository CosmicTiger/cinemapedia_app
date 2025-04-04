import 'package:cinemapedia_app/domain/entities/movie.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int movieId);
  Future<List<Movie>> getFavoriteMovies({int limit = 10, offset = 0});
}
