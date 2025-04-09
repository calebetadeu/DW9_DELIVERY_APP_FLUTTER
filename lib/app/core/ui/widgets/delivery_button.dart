import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final VoidCallback? onPressed; // Corrigido para VoidCallback?
  final String label;
  final Color? backgroundColor;
  final double? height;
  final double? width;

  const DeliveryButton({
    super.key,
    this.onPressed,
    required this.label,
    this.backgroundColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Text(label),
      ),
    );
  }
}