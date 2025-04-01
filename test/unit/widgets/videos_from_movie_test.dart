import 'package:cinemapedia_app/domain/entities/video.dart';
import 'package:cinemapedia_app/presentation/widgets/videos/videos_from_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  const movieId = 123;

  testWidgets('🔄 Muestra loading mientras carga', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          videosFromMovieProvider.overrideWith((ref, id) => Future.value([])),
        ],
        child: const MaterialApp(
          home: Scaffold(
              body: SingleChildScrollView(
                  child: VideosFromMovie(movieId: movieId))),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('✅ Muestra videos cuando carga correctamente', (tester) async {
    final fakeVideos = [
      Video(
          id: '1',
          name: 'Trailer 1',
          youtubeKey: 'abc123',
          publishedAt: DateTime.now()),
      Video(
          id: '2',
          name: 'Behind the Scenes',
          youtubeKey: 'def456',
          publishedAt: DateTime.now()),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          videosFromMovieProvider
              .overrideWith((ref, id) => Future.value(fakeVideos)),
        ],
        child: const MaterialApp(
          home: Scaffold(body: VideosFromMovie(movieId: movieId)),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Título "Videos"
    expect(find.text('Videos'), findsOneWidget);

    // Nombres de los videos
    expect(find.text('Trailer 1'), findsOneWidget);
    expect(find.text('Behind the Scenes'), findsOneWidget);
  });

  testWidgets('❌ Muestra mensaje de error si falla', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          videosFromMovieProvider.overrideWith(
              (ref, id) => Future.error(Exception('Error simulado'))),
        ],
        child: const MaterialApp(
          home: Scaffold(body: VideosFromMovie(movieId: movieId)),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.textContaining('No videos about the movie could be found'),
        findsOneWidget);
  });
}
