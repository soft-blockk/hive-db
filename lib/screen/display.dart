import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String name, email;
  const Display({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black87),
      ),
      body: Column(
        children: [
          Text(name),
          const SizedBox(
            height: 20,
          ),
          Text(email),
        ],
      ),
    );
  }
}
