import 'package:flutter/material.dart';
import 'package:violin/core/colors.dart';

class AlbumInteractionBottomSheet extends StatefulWidget {
  final ValueChanged<double> onRatingSelected;
  final ValueChanged<bool> onFavoriteToggled;
  final ValueChanged<bool> onHeardToggled;
  final bool isFavorited;
  final bool isHeard;

  const AlbumInteractionBottomSheet({
    super.key,
    required this.onRatingSelected,
    required this.onFavoriteToggled,
    required this.onHeardToggled,
    this.isFavorited = false,
    this.isHeard = false,
  });

  @override
  AlbumInteractionBottomSheetState createState() =>
      AlbumInteractionBottomSheetState();
}

class AlbumInteractionBottomSheetState
    extends State<AlbumInteractionBottomSheet> {
  double _rating = 0;
  late bool _isFavorited;
  late bool _isHeard;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.isFavorited;
    _isHeard = widget.isHeard;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                      widget.onFavoriteToggled(_isFavorited);
                    },
                  ),
                  const Text('Favorite'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      _isHeard ? Icons.headphones : Icons.headphones_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _isHeard = !_isHeard;
                      });
                      widget.onHeardToggled(_isHeard);
                    },
                  ),
                  const Text('Heard'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              widget.onRatingSelected(_rating);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
