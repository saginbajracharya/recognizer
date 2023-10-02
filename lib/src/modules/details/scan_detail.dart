import 'package:flutter/material.dart';
import 'package:recognizer/src/widgets/base_layout.dart';

class ScanDetail extends StatefulWidget {
  const ScanDetail({super.key});
  static const routeName = '/scan_detail';

  @override
  State<ScanDetail> createState() => _ScanDetailState();
}

class _ScanDetailState extends State<ScanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: const BaseLayout(
        child: Column(
          children: [
            //Items List
            //Total
            //Cash
          ],
        ),
      )
    );
  }
}