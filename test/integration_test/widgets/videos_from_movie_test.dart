import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/presentation/widgets/videos/videos_from_movie.dart';
import 'package:cinemapedia_app/domain/entities/video.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const testMovieId = 123;

  testWidgets(
      '🔁 Integration Test - VideosFromMovie muestra los videos correctamente',
      (WidgetTester tester) async {
    final fakeVideos = [
      Video(
        id: 'vid1',
        name: 'Video 1',
        youtubeKey: 'abc123',
        publishedAt: DateTime(2023, 10, 5),
      ),
      Video(
        id: 'vid2',
        name: 'Video 2',
        youtubeKey: 'xyz789',
        publishedAt: DateTime(2023, 11, 5),
      ),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          videosFromMovieProvider
              .overrideWith((ref, id) => Future.value(fakeVideos)),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: VideosFromMovie(movieId: testMovieId),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Videos'), findsOneWidget);
    expect(find.text('Video 1'), findsOneWidget);
    expect(find.text('Video 2'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Column), findsWidgets);
  });
}
