import 'package:flutter/material.dart';

class AlbumPreview extends StatelessWidget {
  final String path;
  final double height;
  final double width;
  const AlbumPreview({
    super.key,
    required this.path,
    this.height = 120,
    this.width = 90,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        path,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
