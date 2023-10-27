import 'package:flutter/material.dart';

class ErrorMessageBuilder extends StatelessWidget {
  const ErrorMessageBuilder({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .27,
        ),
        const Icon(
          Icons.info,
          color: Colors.black,
          size: 100,
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ));
  }
}
