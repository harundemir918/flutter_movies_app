import 'package:flutter/material.dart';

class TryAgainWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const TryAgainWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          key: ValueKey("tryAgainText"),
          "Failed to fetch data.",
        ),
        ElevatedButton.icon(
          key: const ValueKey("tryAgainButton"),
          onPressed: onPressed,
          icon: const Icon(Icons.refresh),
          label: const Text("Try again"),
        ),
      ],
    );
  }
}
