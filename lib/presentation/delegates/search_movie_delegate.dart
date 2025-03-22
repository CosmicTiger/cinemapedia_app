// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_app/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia_app/domain/entities/movie.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;
  SearchMovieDelegate({
    required this.searchMovies,
  });

  @override
  String get searchFieldLabel => 'Search Movies';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        duration: const Duration(milliseconds: 200),
        child: IconButton(
            onPressed: () => query = '',
            icon: const Icon(Icons.clear, color: Colors.black)),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return const Text("BuildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: searchMovies(query),
        builder: (context, snapshot) {
          final movies = snapshot.data ?? [];

          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _MovieItem(movie: movies[index], onMovieSelected: close);
              });
        });
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => onMovieSelected(context, movie),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              /// NOTE: Image
              SizedBox(
                width: size.width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    movie.posterPath,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) =>
                        FadeIn(child: child),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              /// NOTE: Description
              SizedBox(
                width: size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title, style: textStyles.titleMedium),
                    const SizedBox(height: 5),
                    (movie.overview.length > 100)
                        ? Text('${movie.overview.substring(0, 100)}...',
                            style: textStyles.bodySmall)
                        : Text(movie.overview, style: textStyles.bodySmall),
                    Row(
                      children: [
                        Icon(Icons.star_half_rounded,
                            color: Colors.yellow.shade800),
                        const SizedBox(width: 5),
                        Text(HumanFormats.number(movie.voteAverage, 1),
                            style: textStyles.bodyMedium!.copyWith(
                                color: Colors.yellow.shade900,
                                fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
