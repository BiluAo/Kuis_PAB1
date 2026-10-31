import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'rating_stars.dart';

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            child: Text(review.author.isEmpty
                ? '?'
                : review.author[0].toUpperCase()),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(review.author,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                RatingStars(rating: review.rating.toDouble(), size: 15),
                if (review.comment.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(review.comment),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}