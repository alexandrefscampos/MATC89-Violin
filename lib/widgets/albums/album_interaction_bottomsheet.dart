import 'package:flutter/material.dart';
import 'package:violin/core/colors.dart';
import 'package:violin/models/search_result_model.dart';

class AlbumInteractionBottomSheet extends StatefulWidget {
  final Result album;
  final Function(Result, int, bool) onTap;
  final bool isFavorited;
  final int? initialRating;

  const AlbumInteractionBottomSheet({
    super.key,
    required this.onTap,
    required this.album,
    this.isFavorited = false,
    this.initialRating,
  });

  @override
  AlbumInteractionBottomSheetState createState() =>
      AlbumInteractionBottomSheetState();
}

class AlbumInteractionBottomSheetState
    extends State<AlbumInteractionBottomSheet> {
  late int _rating;
  late bool _isFavorited;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.isFavorited;
    _rating = widget.initialRating ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Album Interaction',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: VColors.secondary,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              IconButton(
                icon: Icon(
                  _isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorited = !_isFavorited;
                  });
                },
              ),
              const Text('Favorite'),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              widget.onTap.call(widget.album, _rating.toInt(), _isFavorited);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
