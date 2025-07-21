import 'package:dating_app/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../data/models/movie_model.dart';
import '../../../../components/animations/shimmer_effect.dart';

class FavoriteMovieItemWidget extends StatelessWidget {
  final MovieModel movie;
  const FavoriteMovieItemWidget({super.key,required this.movie});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              movie.posterUrl.fixHttps(),
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const ShimmerEffect();
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image,
                    size: 50, color: Colors.grey);
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          movie.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          movie.writer,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, color: AppColors.textMini),
        ),
      ],
    );
  }
}
