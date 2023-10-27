import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
        ),
        Container(
          width: 120,
          height: 120,
          child: const CircularProgressIndicator(strokeWidth: 1),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Loading countries...",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ));
  }
}
