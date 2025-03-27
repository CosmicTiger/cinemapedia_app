import 'package:cinemapedia_app/domain/entities/entities.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/moviedb_videos.dart';

class VideoMapper {
  static movieDBVideoToEntity(Result moviedbVideo) => Video(
      id: moviedbVideo.id,
      name: moviedbVideo.name,
      youtubeKey: moviedbVideo.key,
      publishedAt: moviedbVideo.publishedAt);
}
