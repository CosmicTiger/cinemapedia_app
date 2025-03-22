import 'package:cinemapedia_app/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:cinemapedia_app/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource actorsDatasource;
  ActorRepositoryImpl(
    this.actorsDatasource,
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorsDatasource.getActorsByMovie(movieId);
  }
}
