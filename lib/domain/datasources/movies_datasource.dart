import 'package:cinemapedia_app/domain/entities/movie.dart';

abstract class MoviesDataSource {
  /// NOTE: This should be abstract because in theory we don't really know for sure
  /// from where the data will be coming from considering the huge amount of APIs that may
  /// exists.
  Future<List<Movie>> getNowPlaying({int page = 1});

  /// NOTE: This abstract method would represent the possible movies that are currently playing in theaters. It should exists other homologous method at the repository file.
}
