import 'package:flutter/material.dart';
import 'package:kinoko_note/components/bottom_sheet.dart';
import 'package:kinoko_note/pages/menu_page.dart';
import 'package:kinoko_note/pages/observe/camera_page.dart';
import 'package:path/path.dart';
import '../../model/observation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:io';
import 'package:kinoko_note/preferences/unSavedImagePrefs.dart';

class Iobservation {
  late String name;
  late String imageName;
}

class CameraResultPage extends StatefulWidget {
  const CameraResultPage({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  State<CameraResultPage> createState() => _CameraResultPageState();
}

class _CameraResultPageState extends State<CameraResultPage> {
  late String imagePath;
  late AppDatabase db;
  late List<String> test;
  late Iobservation observation;
  late UnSavedImagePrefs unSavedImagePrefs;
  double? _deviceHeight;

  late List<String> _imagePaths;

  void setName(String name) {
    observation.name = name;
  }

  void setImagePath(String imageName) {
    observation.imageName = imageName;
  }

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    imagePath = widget.imagePath;
    observation = new Iobservation();
    db = AppDatabase();
    unSavedImagePrefs = UnSavedImagePrefs();
  }

  @override
  void dispose() {
    // unSavedImagePrefs.removeUnSavedImages();
    super.dispose();
  }

  Future<int> addObservation() async {
    return this
        .db
        .addObservation(this.observation.name, basename(this.imagePath));
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: FutureBuilder<void>(
          future: unSavedImagePrefs.getUnSavedImages(),
          builder: ((context, AsyncSnapshot snapshot) {
            _imagePaths = snapshot.data;
            return Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                      height: _deviceHeight,
                      initialPage: 0,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      onPageChanged: ((index, reason) => setState(() {
                            activeIndex = index;
                          }))),
                  itemCount: _imagePaths.length,
                  itemBuilder: (context, index, realIndex) {
                    final path = _imagePaths[index];
                    return buildImage(path, index);
                  },
                ),
                // SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: buildIndicator(),
                )
              ],
              fit: StackFit.expand,
            );
          })),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'camera',
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraPage()),
              )
            },
            child: Icon(Icons.add_a_photo),
          ),
          FloatingActionButton(
            heroTag: 'note',
            onPressed: () => _showForm(context),
            child: Icon(Icons.edit_note),
          ),
          FloatingActionButton.extended(
            elevation: 4.0,
            label: const Text('Save'),
            icon: const Icon(Icons.add),
            // heroTag: 'save',
            onPressed: () async {
              await this.addObservation();
              unSavedImagePrefs.removeUnSavedImages();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
            },
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  void _showForm(context) async {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        builder: (_) => builderBottomSheet(context, setName));
  }

  Widget buildImage(path, index) => Container(
        color: Colors.grey,
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: 600,
              height: 240,
              child: Image.file(File(path), fit: BoxFit.cover),
            ))
          ],
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: _imagePaths.length,
        effect: JumpingDotEffect(
            dotHeight: 16,
            dotWidth: 16,
            activeDotColor: Colors.green,
            dotColor: Colors.white),
      );
}
