import 'package:flutter/material.dart';

class ErrorMsg extends StatelessWidget {
  const ErrorMsg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Something went error',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
