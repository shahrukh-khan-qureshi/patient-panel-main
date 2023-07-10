import 'dart:async';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CallingScreen extends StatefulWidget {
  final ImageProvider avatarImage;
  final String doctorName;
  final bool isVideoCall;

  const CallingScreen({
    Key? key,
    required this.avatarImage,
    required this.doctorName,
    required this.isVideoCall,
  }) : super(key: key);

  @override
  _CallingScreenState createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  Timer? _timer;
  int _durationInSeconds = 0;
  bool _isCallAccepted = false;
  bool _isCallEnded = false;
  CameraController? _cameraController;
  late Future<void> _initializeCameraController;

  @override
  void initState() {
    super.initState();
    if (widget.isVideoCall) {
      _initializeCameraController = initializeCamera();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cameraController?.dispose();
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

  void acceptCall() {
    setState(() {
      _isCallAccepted = true;
    });
    startTimer();
    if (widget.isVideoCall) {
      initializeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: !_isCallEnded ? null : SizedBox.shrink(),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wave_design_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_isCallAccepted || !widget.isVideoCall) ...[
                SizedBox(height: 80),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: widget.avatarImage,
                ),
              ],
              SizedBox(height: 20),
              if (_isCallAccepted && widget.isVideoCall) ...[
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
              if (!_isCallAccepted ||
                  (widget.isVideoCall &&
                      !_cameraController!.value.isInitialized)) ...[
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
                    if (widget.isVideoCall) ...[
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green,
                        child: IconButton(
                          icon: Icon(Icons.video_call),
                          color: Colors.white,
                          onPressed: () {
                            acceptCall();
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ],
              if (_isCallEnded) ...[
                SizedBox(height: 80),
                Text(
                  'Call ended',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
          if (_isCallAccepted &&
              widget.isVideoCall &&
              _cameraController != null &&
              _cameraController!.value.isInitialized) ...[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: _cameraController!.value.aspectRatio,
                      child: CameraPreview(_cameraController!),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
