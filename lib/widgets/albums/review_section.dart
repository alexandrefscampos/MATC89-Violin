import 'package:flutter/material.dart';
import 'package:violin/widgets/shared/v_button.dart';

class ReviewSection extends StatefulWidget {
  final List<String> reviews;
  final Function(String) onReviewSubmitted;

  const ReviewSection({
    super.key,
    required this.reviews,
    required this.onReviewSubmitted,
  });

  @override
  ReviewSectionState createState() => ReviewSectionState();
}

class ReviewSectionState extends State<ReviewSection> {
  final _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _reviewController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Write your review here...',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        VButton(
          label: 'Submit Review',
          onPressed: () {
            if (_reviewController.text.isNotEmpty) {
              widget.onReviewSubmitted(_reviewController.text);
              _reviewController.clear();
            }
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
