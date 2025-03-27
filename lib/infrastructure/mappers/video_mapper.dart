import 'package:cinemapedia_app/domain/entities/entities.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/moviedb_videos.dart';

class VideoMapper {
  static movieDBVideoToEntity(Result movieDBVideo) {
    return Video(
      id: movieDBVideo.id,
      name: movieDBVideo.name,
      youtubeKey: movieDBVideo.key,
      publishedAt: movieDBVideo.publishedAt,
    );
  }
}
