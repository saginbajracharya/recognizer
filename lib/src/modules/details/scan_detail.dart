import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recognizer/src/modules/recognizer/recognizer_controller.dart';
import 'package:recognizer/src/widgets/base_layout.dart';

class ScanDetail extends StatefulWidget {
  const ScanDetail({super.key});
  static const routeName = '/scan_detail';

  @override
  State<ScanDetail> createState() => _ScanDetailState();
}

class _ScanDetailState extends State<ScanDetail> {
  final recognizerCon      = Get.put(RecognizerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: BaseLayout(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize      : MainAxisSize.max,
          children: [
            //Cash Receipt 
            //Date
            const Divider(),
            //Items List
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: recognizerCon.recognizedTextData.blocks.length,
                itemBuilder: (context, index) {
                  final text = recognizerCon.recognizedTextData.blocks[index].text;
                  // Check the text and conditionally create UI elements
                  if (index == 0 || index == 1) {
                    // For index 0 (Cash Receipt), display it in a row with Date (index 1)
                    if (index == 0) {
                      return Row(
                        children: [
                          Text(text),
                          const SizedBox(width: 8), // Add spacing between Cash Receipt and Date
                          Text(recognizerCon.recognizedTextData.blocks[1].text), // Display Date
                        ],
                      );
                    } else {
                      // For index 1 (Date), return an empty container since it's already displayed with Cash Receipt
                      return Container();
                    }
                  } else {
                    return ListTile(
                      title: Text(text),
                    );
                  }
                },
              ),
            ),
            const Divider(),
            //Total
            //Cash
            //Change
          ],
        ),
      )
    );
  }
}