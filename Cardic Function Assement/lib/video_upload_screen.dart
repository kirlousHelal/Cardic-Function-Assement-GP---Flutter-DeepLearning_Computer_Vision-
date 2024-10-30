import 'dart:io';

import 'package:cardic_function_assement_2/api_result.dart';
import 'package:cardic_function_assement_2/load_flash_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoUploadScreen extends StatefulWidget {
  const VideoUploadScreen({super.key});

  @override
  _VideoUploadScreenState createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
  VideoPlayerController _videoPlayerController =
      VideoPlayerController.file(File(""));

  late Future<void> _initializeVideoPlayerFuture;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Center(
          child: Text(
            'Upload Video',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/uploadImage.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "Please Pick a Video",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(type: FileType.video, allowCompression: true);
                  if (result != null) {
                    PlatformFile file = result.files.first;
                    _videoPlayerController =
                        VideoPlayerController.file(File(file.path.toString()))
                          ..initialize().then((_) {
                            setState(() {});
                            _initializeVideoPlayerFuture =
                                _videoPlayerController.initialize();
                          });
                    APIResult.videoPath = file.path.toString();
                  }
                },
                color: Colors.blueAccent,
                child: const Text(
                  "Upload Video",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 20),

              // Displaying the video with enhanced style
              _videoPlayerController.value.isInitialized
                  ? FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: AspectRatio(
                              aspectRatio:
                                  _videoPlayerController.value.aspectRatio,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    VideoPlayer(_videoPlayerController),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (_videoPlayerController
                                              .value.isPlaying) {
                                            _videoPlayerController.pause();
                                          } else {
                                            _videoPlayerController.play();
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        _videoPlayerController.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const Text("");
                        }
                      },
                    )
                  : const Text('No video selected'),
              const SizedBox(height: 20),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    onPressed: () {
                      if (_videoPlayerController.value.isInitialized) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoadingScreen(),
                          ),
                        );
                      } else {
                        // Show alert dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                "ALERT:",
                                style: TextStyle(color: Colors.red),
                              ),
                              content: const Text(
                                "Please Pick a Video First",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    color: Colors.blueAccent,
                    child: const Text(
                      "Analyze The Video",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
