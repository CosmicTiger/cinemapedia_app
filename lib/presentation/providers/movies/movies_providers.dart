import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_repository_provider.dart';
import 'package:riverpod/riverpod.dart';

/// NOTE: Applying SOLID we are pretending to create a class that could be extensible
/// and easily customizable but also restrictive in its changes.

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

/// NOTE: The following Callback definition will help to understand our MovieNotifier
/// that whatever the repository or any method of connection that handles our data will
/// provide a callback in which could load the new list of movies.
/// It defines Use Case.
typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  /// NOTE: This will help to understand current page of the movies that are being displayed.
  /// Or any possible search query attempts and so on.
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
