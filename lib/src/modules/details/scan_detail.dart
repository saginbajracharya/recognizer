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
            //Date
            //Items List
            ListView.builder(
              shrinkWrap : true,
              itemCount  : recognizerCon.recognizedTextList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title   : Text(recognizerCon.recognizedTextList[index]),
                  trailing: Text(recognizerCon.recognizedTextList[index]),
                );
              },
            )
            //Total
            //Cash
            //Change
          ],
        ),
      )
    );
  }
}