import 'package:cinemapedia_app/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  final double voteAverage;
  final double popularity;

  const MovieRating(
      {super.key, required this.voteAverage, required this.popularity});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(Icons.star_half_outlined,
              color: Colors.yellow.shade800, size: 15),
          const SizedBox(width: 3),
          Text(HumanFormats.number(voteAverage, 1),
              style: textStyles.bodyMedium
                  ?.copyWith(color: Colors.yellow.shade800)),
          const Spacer(),
          Icon(Icons.people, color: Colors.grey, size: 15),
          const SizedBox(width: 3),
          Text(HumanFormats.number(popularity), style: textStyles.bodySmall),
        ],
      ),
    );
  }
}
