// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/video%20page/video_play_page.dart';

import '../../utils/colors/colors.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  GlobalKey<FormState> abcKey = GlobalKey<FormState>();
  bool _isLoading = true;
  bool _isRecording = false;
  late CameraController _cameraController;

  late List<CameraDescription> _availableCameras;
  String title = "";
  int secondsRemaining = 59;
  late Timer timer;
  @override
  void initState() {
    _getAvailableCameras();
    title = Get.arguments.toString();

    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    timer.cancel();
    super.dispose();
  }

  // get available cameras
  Future<void> _getAvailableCameras() async {
    WidgetsFlutterBinding.ensureInitialized();
    _availableCameras = await availableCameras();
    _initCamera(_availableCameras.reversed.first);
  }

  // init camera
  Future<void> _initCamera(CameraDescription description) async {
    _cameraController = CameraController(description, ResolutionPreset.medium,
        enableAudio: true);

    try {
      await _cameraController.initialize();

      setState(() => _isLoading = false);
    } catch (e) {
      print('camera = ' + e.toString());
    }
  }

  void _toggleCameraLens() {
    // get current lens direction (front / rear)
    final lensDirection = _cameraController.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.front) {
      newDescription = _availableCameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.back);
    } else {
      newDescription = _availableCameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.front);
    }

    if (newDescription != null) {
      _initCamera(newDescription);
    } else {
      print('Asked camera not available');
    }
  }

  _recordVideo() async {
    try {
      if (_isRecording) {
        final file = await _cameraController.stopVideoRecording();

        setState(() => _isRecording = false);
        final route = MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) =>
              VideoPage(key: abcKey, filePath: file.path, title: title),
        );
        Navigator.pushReplacement(context, route);
      } else {
        await _cameraController.prepareForVideoRecording();
        await _cameraController.startVideoRecording();
        setState(() => _isRecording = true);
      }
    } catch (e) {
      log('video = ' + e.toString());
    }
  }

  void timeOutVideo() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
          print(timer.tick.toString());
        });
      } else {
        setState(() {
          timer.cancel();

          _cameraController.pausePreview();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(child: CameraPreview(_cameraController)),
          Container(
            width: double.infinity,
            color: DynamicColor.white,
            child: _isRecording
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.centerRight,
                          color: DynamicColor.white,
                          child: Text(
                            secondsRemaining != 0
                                ? secondsRemaining < 10
                                    ? '0:0$secondsRemaining'
                                    : '0:$secondsRemaining'
                                : '0:00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: DynamicColor.blue),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.centerLeft,
                          child: FloatingActionButton(
                            heroTag: 1,
                            backgroundColor: Colors.red,
                            child: Icon(
                                _isRecording ? Icons.stop : Icons.video_call),
                            onPressed: () {
                              _recordVideo();
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: FloatingActionButton(
                          heroTag: 1,
                          backgroundColor: Colors.red,
                          child: Icon(
                              _isRecording ? Icons.stop : Icons.video_call),
                          onPressed: () {
                            _recordVideo();
                            timeOutVideo();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: FloatingActionButton(
                          heroTag: 2,
                          backgroundColor: DynamicColor.darkBlue,
                          child: const Icon(Icons.change_circle),
                          onPressed: () => _toggleCameraLens(),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      );
    }
  }
}
