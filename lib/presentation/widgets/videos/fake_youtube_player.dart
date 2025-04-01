// 1️⃣ Extrae esto en un archivo independiente (solo para testing)
import 'package:flutter/material.dart';

class FakeYoutubePlayer extends StatelessWidget {
  final String youtubeId;
  final String name;

  const FakeYoutubePlayer({
    super.key,
    required this.youtubeId,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 200, color: Colors.black26),
        Text(name, key: Key('video-title-$youtubeId')),
      ],
    );
  }
}
