import 'package:flutter/material.dart';
import 'package:recognizer/src/widgets/base_layout.dart';

class RecognizerView extends StatefulWidget {
  const RecognizerView({super.key});
  static const routeName = '/';

  @override
  State<RecognizerView> createState() => _RecognizerViewState();
}

class _RecognizerViewState extends State<RecognizerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Scan That Receipt'),
      ),
      body: const BaseLayout(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Scan Button')
          ],
        ),
      ),
    );
  }
}