import 'package:cinemapedia_app/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:cinemapedia_app/presentation/widgets/widgets.dart';

final similarMoviesProvider = FutureProvider.family((ref, int movieId) async {
  final movies =
      await ref.read(movieRepositoryProvider).getSimilarMovies(movieId);
  return movies;
});

class SimilarMovies extends ConsumerWidget {
  final int movieId;

  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMoviesFuture = ref.watch(similarMoviesProvider(movieId));

    return similarMoviesFuture.when(
      data: (movies) => _Recommendations(
        movies: movies,
      ),
      error: (_, __) =>
          Center(child: Text('No similar movies could be uploaded 💀')),
      loading: () => const Center(
          child: CircularProgressIndicator(
        strokeWidth: 2,
      )),
    );
  }
}

class _Recommendations extends StatelessWidget {
  final List<Movie> movies;

  const _Recommendations({
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox();

    return Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: MovieHorizontalListView(title: 'Recommended', movies: movies));
  }
}
