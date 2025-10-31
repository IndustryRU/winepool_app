import 'package:flutter/material.dart';

class EbsVerificationScreen extends StatelessWidget {
  const EbsVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Верификация через ЕБС'),
      ),
      body: const Center(
        child: Text('Экран верификации через ЕБС'),
      ),
    );
  }
}