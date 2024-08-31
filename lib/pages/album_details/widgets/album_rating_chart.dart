import 'package:flutter/material.dart';
import 'package:violin/core/colors.dart';

class AlbumRatingChart extends StatelessWidget {
  final List<int> ratingCounts;

  const AlbumRatingChart({
    super.key,
    required this.ratingCounts,
  });

  @override
  Widget build(BuildContext context) {
    int maxCount =
        ratingCounts.reduce((max, element) => max > element ? max : element);

    return Container(
      color: VColors.secondary.withOpacity(0.05),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(5, (index) {
          final rating = index + 1;
          final count = ratingCounts[index];
          return Expanded(
            child: Column(
              children: [
                const Icon(Icons.star, color: VColors.secondary, size: 16),
                const SizedBox(height: 4),
                Flexible(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: 20,
                            color: Colors.grey[800],
                          ),
                          Container(
                            width: 20,
                            height: constraints.maxHeight * (count / maxCount),
                            color: VColors.secondary,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 4),
                //TODO ADD AVERAGE RATING
                Text(
                  '$rating',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
