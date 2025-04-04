import 'package:cinemapedia_app/infrastructure/mappers/mappers.dart';
import 'package:cinemapedia_app/infrastructure/models/models.dart';
import 'package:dio/dio.dart';

import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/entities.dart';

class MovieDBDataSource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDBAPIKey,
        'language': 'en-US'
      }));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDBResponse.fromJson(json);
    final List<Movie> movies = movieDBResponse.results
        .map((e) => MovieMapper.movieDBToEntity(e))
        .where((movieDBResponse) => movieDBResponse.posterPath != 'no-poster')
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {
        'page': page,
      },
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {
        'page': page,
      },
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {
        'page': page,
      },
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {
        'page': page,
      },
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');

    if (response.statusCode != 200) {
      throw Exception("Movie with id: $id not found.");
    }

    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) {
      return [];
    }

    final response = await dio.get(
      '/search/movie',
      queryParameters: {
        'query': query,
      },
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) async {
    final response = await dio.get('/movie/$movieId/similar');
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) async {
    final response = await dio.get('/movie/$movieId/videos');
    final movieDBResponse = MovieDBVideosResponse.fromJson(response.data);

    final videos = <Video>[];

    for (final movieDBVideo in movieDBResponse.results) {
      if (movieDBVideo.site == 'YouTube') {
        final video = VideoMapper.movieDBVideoToEntity(movieDBVideo);
        videos.add(video);
      }
    }

    return videos;
  }
}
