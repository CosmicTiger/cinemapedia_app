import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:riverpod/riverpod.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

/// NOTE: This implementation possess a memory caché implementation in which all possible detail that
/// has already been fetched doesn't need to take another load just for the sake of re render the widget with that
/// data. This is a very useful feature that can be used in many different scenarios.
/// {
///   'movieId': Movie(),
///  '5423451': Movie(),
///   '5412123': Movie(),
///  '1231231': Movie(),
/// }

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) {
      return;
    }

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
