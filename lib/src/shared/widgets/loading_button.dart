import 'package:flutter/material.dart';

/// A full-width ElevatedButton that shows a CircularProgressIndicator when loading.
class LoadingButton extends StatelessWidget {
  const LoadingButton({
    required this.onPressed,
    required this.isLoading,
    required this.label,
    super.key,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(label),
    );
  }
}
