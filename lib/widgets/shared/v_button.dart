import 'package:flutter/material.dart';
import 'package:violin/core/colors.dart';

class VButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData? icon;
  const VButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: Text(
        label,
        style: const TextStyle(color: VColors.primary),
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size(160, 40),
        ),
        backgroundColor: WidgetStateProperty.all(
          VColors.secondary,
        ),
      ),
      icon: icon != null
          ? Icon(
              icon,
              color: VColors.primary,
            )
          : const SizedBox.shrink(),
    );
  }
}
