import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:recognizer/src/common/styles.dart';
import 'package:recognizer/src/modules/details/scan_detail.dart';
import 'package:recognizer/src/modules/recognizer/activity_indicator/activity_indicator.dart';
import 'package:recognizer/src/modules/recognizer/detector_view.dart';
import 'package:recognizer/src/modules/recognizer/painters/text_detector_painter.dart';
import 'package:recognizer/src/modules/recognizer/recognizer_controller.dart';
import 'package:recognizer/src/modules/settings/settings_view.dart';

class RecognizerView extends StatefulWidget {
  const RecognizerView({super.key});
  static const routeName = '/';

  @override
  State<RecognizerView> createState() => _RecognizerViewState();
}

class _RecognizerViewState extends State<RecognizerView> {
  final recognizerCon      = Get.put(RecognizerController());
  var _script              = TextRecognitionScript.latin;
  var _textRecognizer      = TextRecognizer(script: TextRecognitionScript.latin);
  var _cameraLensDirection = CameraLensDirection.back;
  bool _canProcess         = true;
  bool _isBusy             = false;
  String? currentScanMethod= '';
  CustomPaint? _customPaint;
  String? _text;

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // CAMERA VIEW
          DetectorView(
            title: 'Text Detector',
            customPaint: _customPaint,
            text: _text,
            onImage: _processImage,
            initialCameraLensDirection: _cameraLensDirection,
            onCameraLensDirectionChanged: (value) => _cameraLensDirection = value,
          ),
          // Dropdown Scripts
          Positioned(
            top  : 30,
            left : 100,
            right: 100,
            child: Row(
              children: [
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: grey800,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0,right:10.0),
                    child: _buildDropdown(context),
                  )
                ),
                const Spacer(),
              ],
            )
          ),
          // Settings button
          Positioned(
            top  : 30,
            left : 10,
            child: IconButton(
              padding: const EdgeInsets.only(left: 10,right: 12.0),
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ),
          // Save Button
          Positioned(
            bottom: kBottomNavigationBarHeight+20,
            left  : 100,
            right : 100,
            child : doneButton(context),
          )
        ],
      ),
    );
  }

  // Dropdown Scripts
  Widget _buildDropdown(context){ 
    dynamic textStyles = TextStyles(context);
    return Padding(
      padding: EdgeInsets.zero,
      child: DropdownButton<TextRecognitionScript>(
        value: _script,
        icon: const Icon(Icons.arrow_downward),
        elevation: 2,
        style: textStyles.button,
        underline: Container(), // Remove the underline
        onChanged: (TextRecognitionScript? script) {
          if (script != null) {
            setState(() {
              _script = script;
              _textRecognizer.close();
              _textRecognizer = TextRecognizer(script: _script);
            });
          }
        },
        items: TextRecognitionScript.values.map<DropdownMenuItem<TextRecognitionScript>>((script) {
          return DropdownMenuItem<TextRecognitionScript>(
            value: script,
            child: Text(script.name.toUpperCase()),
          );
        }).toList(),
      ),
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.metadata?.size != null && inputImage.metadata?.rotation != null) {
      final painter = TextRecognizerPainter(
        recognizedText,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
      );
      currentScanMethod = 'liveScan';
      recognizerCon.recognizedText = recognizedText;
      _customPaint = CustomPaint(painter: painter);
    } else {
      currentScanMethod = 'imageScan';
      recognizerCon.recognizedText = recognizedText.text;
      _text = 'Recognized text:\n\n${recognizedText.text}';
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  Widget doneButton(context){
    dynamic textStyles = TextStyles(context);
    return ElevatedButton(
      onPressed: () async{
        if (recognizerCon.recognizedText!='' || recognizerCon.recognizedText!=null) {
          setState(() {
            recognizerCon.recognizedTextData=recognizerCon.recognizedText;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) => ScanDetail(fromPage: currentScanMethod)));
        }
        else{
          Toast().showSimpleToast(
            'Nothing to Save',
            context
          );
        }
      },
      child: Text('Save',style: textStyles.button),
    );
  }
}