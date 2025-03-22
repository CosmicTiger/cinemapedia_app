import 'package:cinemapedia_app/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// NOTE: This file is to provide globally a single implementation of the Repository implementation

/// NOTE: This repository is and should be immutable.
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMoviedbDatasource());
});
