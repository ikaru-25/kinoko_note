// https://zenn.dev/mamushi/articles/flutter_camera
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_result_page.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';

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
  late Future<Directory> _imagePath;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
    // _imagePath = getApplicationDocumentsDirectory();
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
    final Uint8List buffer = await image.readAsBytes();

    String? _imagePath = (await getExternalStorageDirectory())?.path;
    print("画像フォルダを表示------------------------");
    print(_imagePath);

    final String savePath = '$_imagePath/${image.name}';
    final File saveFile = File(savePath);
    print(savePath);
    saveFile.writeAsBytesSync(buffer, flush: true, mode: FileMode.write);
    // ギャラリーへの保存
    // await ImageGallerySaver.saveImage(buffer, name: image.name);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: Center(
        child: FutureBuilder<void>(
            future: Future.wait([_initializeControllerFuture]),
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
          // final image = await _controller.takePicture();
          final image = await getImage();

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
