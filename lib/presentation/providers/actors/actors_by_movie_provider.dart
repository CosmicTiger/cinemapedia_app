import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:cinemapedia_app/presentation/providers/actors/actors_repository_provider.dart';
import 'package:riverpod/riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsByMovieProvider = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier(
      getActors: actorsByMovieProvider.getActorsByMovie);
});

/// NOTE: Similar as the one with cached movie details we would like to precached actors by movie
/// in order to avoid unnecesary loads of the same data.
/// {
///   'movieId': List<Actors>(),
///  '5423451': List<Actors>(),
///   '5412123': List<Actors>(),
///  '1231231': List<Actors>(),
/// }

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) {
      return;
    }

    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
