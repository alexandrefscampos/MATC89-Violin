import 'package:flutter/material.dart';
import 'package:violin/core/colors.dart';
import 'package:violin/core/consts.dart';

class ReviewCard extends StatelessWidget {
  final String review;
  final VoidCallback onDelete;
  final String user;
  const ReviewCard({
    required this.review,
    required this.onDelete,
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: VColors.secondary.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Review by $user',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  //TODO ADD USER RATING
                  //TODO ADD COMMENT A REVIEW
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 180,
                  child: Text(
                    review,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
