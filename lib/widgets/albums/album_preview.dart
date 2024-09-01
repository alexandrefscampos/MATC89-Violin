import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:violin/controllers/user_controller.dart';

class AlbumPreview extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final allowImages = ref.read(userControllerProvider.notifier).allowImages();
    return allowImages
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              path,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          )
        : const SizedBox.shrink();
  }
}
