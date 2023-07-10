import 'dart:async';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CallingScreen extends StatefulWidget {
  final ImageProvider avatarImage;
  final String doctorName;

  const CallingScreen({
    Key? key,
    required this.avatarImage,
    required this.doctorName,
  }) : super(key: key);

  @override
  _CallingScreenState createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  CameraController? _cameraController;
  late Future<void> _initializeCameraController;

  Timer? _timer;
  int _durationInSeconds = 0;
  bool _isCallAccepted = false;
  bool _isCallEnded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    await _cameraController!.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _durationInSeconds++;
      });
    });
  }

  String getFormattedDuration() {
    final minutes = (_durationInSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_durationInSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void endCall() {
    _timer?.cancel();
    setState(() {
      _isCallEnded = true;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCallAccepted) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: !_isCallEnded ? null : SizedBox.shrink(),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wave_design_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              CircleAvatar(
                radius: 80,
                backgroundImage: widget.avatarImage,
              ),
              SizedBox(height: 20),
              Text(
                widget.doctorName,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 40),
              Text(
                'Duration: ${getFormattedDuration()}',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 40),
              Text(
                'Calling...',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                    child: IconButton(
                      icon: Icon(Icons.call_end),
                      color: Colors.white,
                      onPressed: () {
                        endCall();
                      },
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: Icon(Icons.video_call),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          _isCallAccepted = true;
                        });
                        startTimer();
                        initializeCamera();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      if (_cameraController == null || !_cameraController!.value.isInitialized) {
        return Container(); // Return an empty container if the camera is not initialized yet
      }

      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: !_isCallEnded ? null : SizedBox.shrink(),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wave_design_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: _cameraController!.value.aspectRatio,
                child: CameraPreview(_cameraController!),
              ),
              SizedBox(height: 20),
              Text(
                widget.doctorName,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 40),
              Text(
                'Duration: ${getFormattedDuration()}',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      );
    }
  }
}
