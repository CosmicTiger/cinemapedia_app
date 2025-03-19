import 'package:cinemapedia_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

/// NOTE: This file is to provide globally a single implementation of the Repository implementation

/// NOTE: This repository is and should be immutable.
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDBDataSource());
});
