import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recognizer/src/common/styles.dart';
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
  late int totalItemIndex = -1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: BaseLayout(
        customMargin: const EdgeInsets.only(left:30.0,right:30.0),
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
    dynamic textStyles = TextStyles(context);
    List<String> textList = recognizerCon.recognizedTextData.split('\n');
    List<String> items = [];
    List<String> prices = [];

    // Create a list to indicate which items are "Total"
    List<bool> isTotalItem = List.filled(items.length, false);

    // Loop through items to identify "Total" items and set the corresponding flag
    for (int i = 0; i < items.length; i++) {
      if (items[i] == 'Total') {
        isTotalItem[i] = true;
      }
    }

    // Separate items and prices
    for (int i = 0; i < textList.length; i ++) {
      if(textList[i].contains('Date')&& i == 0)
      {
        //do nothing
      }
      else{
        bool containsNumber = RegExp(r'\d').hasMatch(textList[i]);
        if (containsNumber) {
          prices.add(textList[i]);
        } else {
          items.add(textList[i]);
        }
      }
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize      : MainAxisSize.max,
        children: [
          textList[0].contains("Cash")
          ?Column(
            children: [
              SelectableText(textList[0],textAlign: TextAlign.center,style: textStyles.receiptHeading),
              const Divider()
            ],
          )
          :const SizedBox(),
          Row(
            children: [
              Expanded(
                flex: 1, // This will make the first list take 50% of the available space
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, itemsIndex) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          checkAndAddDivider(items,itemsIndex),
                          SelectableText(items[itemsIndex],style: textStyles.receiptItems),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1, // This will make the second list take 50% of the available space
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: prices.length,
                    itemBuilder: (context, pricesIndex) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          pricesIndex==totalItemIndex?const Divider():const SizedBox(),
                          SelectableText(prices[pricesIndex],style: textStyles.receiptPrice),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  checkIsNumber(inputString)async{
    bool containsNumber = RegExp(r'\d').hasMatch(inputString);
    if (containsNumber) {
      return true;
    } else {
      return false;
    }
  }

  checkAndAddDivider(items,itemsIndex){
    if (items[itemsIndex] == 'Total'){
      totalItemIndex = itemsIndex;
      return const Divider();
    }
    else{
      return const SizedBox();
    }
  }
}