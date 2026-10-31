import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'poster_image.dart';

class RecommendationCarousel extends StatelessWidget {
  final List<Movie> movies; // sudah diurutkan dari rating tertinggi
  final ValueChanged<Movie> onTap;

  const RecommendationCarousel({
    super.key,
    required this.movies,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 10),
          child: Row(
            children: [
              Icon(Icons.local_fire_department, color: Colors.orangeAccent),
              SizedBox(width: 6),
              Text('Rekomendasi untuk Kamu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: 235,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: movies.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, i) {
              final m = movies[i];
              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onTap(m),
                child: SizedBox(
                  width: 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          PosterImage(movie: m, width: 125, height: 170),
                          Positioned(
                            top: 6,
                            left: 6,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.black87,
                              child: Text('${i + 1}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(m.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded,
                              size: 16, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(m.averageRating.toStringAsFixed(1)),
                          const SizedBox(width: 6),
                          Text(m.genre,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}