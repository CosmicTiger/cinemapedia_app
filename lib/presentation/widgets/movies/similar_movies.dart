import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return FutureBuilder(
        future: ref.read(movieRepositoryProvider).getSimilarMovies(movieId),
        builder: (context, snapshot) {
          return Placeholder();
        });
  }
}
