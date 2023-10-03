import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recognizer/src/modules/recognizer/recognizer_controller.dart';
import 'package:recognizer/src/widgets/base_layout.dart';

class ScanDetail extends StatefulWidget {
  final String? fromPage;
  const ScanDetail({super.key,this.fromPage});
  static const routeName = '/scan_detail';

  @override
  State<ScanDetail> createState() => _ScanDetailState();
}

class _ScanDetailState extends State<ScanDetail> {
  final recognizerCon = Get.put(RecognizerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: BaseLayout(
        child: widget.fromPage=='liveScan'
        ? liveScanResult()
        : imageScanResult()
      )
    );
  }

  scanDetailChildReturner(){
    if(widget.fromPage=='liveScan'){
      return liveScanResult();
    }
    else if(widget.fromPage=='imageScan'){
      return imageScanResult();
    }
    else{
      return const SizedBox();
    }
  }

  liveScanResult(){
    return Column(
      mainAxisAlignment : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize      : MainAxisSize.max,
      children: [
        //Cash Receipt 
        //Date
        //Items List
        //Total
        //Cash
        //Change
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: recognizerCon.recognizedTextData.blocks.length,
            itemBuilder: (context, index) {
              final text = recognizerCon.recognizedTextData.blocks[index].text;
              if (index == 0 || index == 1) {
                // For index 0 (Cash Receipt), display it in a row with Date (index 1)
                if (index == 0) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text),
                      const SizedBox(width: 8), // Add spacing between Cash Receipt and Date
                    ],
                  );
                }
                else if(index ==1){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text)
                    ],
                  );
                }
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text),
                  ],
                );
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  imageScanResult(){
    return Column(
      mainAxisAlignment : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize      : MainAxisSize.max,
      children: [
        //Cash Receipt 
        //Date
        //Items List
        //Total
        //Cash
        //Change
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: recognizerCon.recognizedTextData.blocks.length,
            itemBuilder: (context, index) {
              final text = recognizerCon.recognizedTextData.blocks[index].text;
              if (index == 0 || index == 1) {
                // For index 0 (Cash Receipt), display it in a row with Date (index 1)
                if (index == 0) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text),
                      const SizedBox(width: 8), // Add spacing between Cash Receipt and Date
                    ],
                  );
                }
                else if(index ==1){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text)
                    ],
                  );
                }
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text),
                  ],
                );
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}