import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);
  static const valueKey = ValueKey('Checkout');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: const Center(child: Text('This is Checkout Screen')),
    );
  }
}
