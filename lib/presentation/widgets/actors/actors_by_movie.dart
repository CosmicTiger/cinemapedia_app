import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';

import 'package:cinemapedia_app/presentation/providers/providers.dart';

class ActorsByMovie extends ConsumerWidget {
  final int movieId;

  const ActorsByMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, ref) {
    final actorsByMovie = ref.watch(actorsByMovieProvider);

    if (actorsByMovie[movieId.toString()] == null) {
      return Container(
          height: 100,
          margin: const EdgeInsets.only(bottom: 50),
          child:
              Center(child: const CircularProgressIndicator(strokeWidth: 2)));
    }
    final actors = actorsByMovie[movieId.toString()]!;

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];

          return Container(
            padding: const EdgeInsets.all(8.0),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Actor Photo
                FadeInRight(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        height: 180,
                        width: 135,
                        fit: BoxFit.cover,
                        placeholder: const AssetImage(
                            'assets/loaders/bottle-loader.gif'),
                        image: NetworkImage(
                          actor.profilePath,
                        ),
                      )),
                ),

                // Nombre
                const SizedBox(
                  height: 5,
                ),

                Text(actor.name, maxLines: 2),
                Text(
                  actor.character ?? '',
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
