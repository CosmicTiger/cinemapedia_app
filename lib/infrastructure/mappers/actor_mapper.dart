import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) {
    return Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG0mU1hiNmdzqNKOq2N5c6qIxkFmeKNAhvfw&s',
      character: cast.character,
    );
  }
}
