import 'package:cinemapedia_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView>
    with AutomaticKeepAliveClientMixin {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;

    final movies =
        await ref.read(favoritesMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final favoriteMovies = ref.watch(favoritesMoviesProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
            Text('Ohhh no!! 😢',
                style: TextStyle(fontSize: 30, color: colors.primary)),
            Text('No favorite movies yet 📽️',
                style: TextStyle(fontSize: 20, color: colors.secondary)),
            const SizedBox(height: 20),
            FilledButton.tonal(
                onPressed: () => context.go('/home/0'),
                child: const Text('Begin to search 🎥 🕵️'))
          ],
        ),
      );
    }

    return Scaffold(
        body: MovieMasonry(loadNextPage: loadNextPage, movies: favoriteMovies));
  }
}
