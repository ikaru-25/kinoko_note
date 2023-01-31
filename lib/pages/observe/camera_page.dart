// https://zenn.dev/mamushi/articles/flutter_camera
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_result_page.dart';

class CameraPage extends StatefulWidget {
  /// Default Constructor
  const CameraPage({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // ウィジェットが破棄されたら、コントローラーを破棄
    _controller.dispose();
    super.dispose();
  }

  Future getImage() async {
    // WidgetsFlutterBinding.ensureInitialized();
    final image = await _controller.takePicture();
    print(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: Center(
        child: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Container(
                      width: 600,
                      height: 240,
                      child: CameraPreview(_controller),
                    ))
                  ],
                ));
                // return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final image = await _controller.takePicture();
          print(image.path);

          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CameraResultPage(imagePath: image.path),
              fullscreenDialog: true,
            ),
          );
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
