import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// NOTE: Quite not necessary to use this provider, but it's a good practice to use it.
/// To understand certain applicability on how to use Riverpod.
final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) {
    return [];
  }

  return nowPlayingMovies.sublist(0, 6);
});
