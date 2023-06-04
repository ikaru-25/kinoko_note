import 'package:flutter/material.dart';
import 'package:kinoko_note/components/bottom_sheet.dart';
import 'package:kinoko_note/pages/menu_page.dart';
import 'package:kinoko_note/pages/observe/camera_page.dart';
import 'package:kinoko_note/model/db.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:io';
import 'package:kinoko_note/preferences/unSavedImagePrefs.dart';
import 'package:kinoko_note/components/bottom_navigation.dart';
import 'package:kinoko_note/interfaces/observation.interface.dart';

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
  late IObservation observation;
  late UnSavedImagePrefs unSavedImagePrefs;
  double? _deviceHeight;

  late List<String> _imagePaths;

  setFormData(IObservation observation) {
    this.observation = observation;
  }

  // void setImagePath(String imageName) {
  // observation.imageName = imageName;
  // }

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    imagePath = widget.imagePath;
    observation = new IObservation();
    db = AppDatabase();
    unSavedImagePrefs = UnSavedImagePrefs();
  }

  @override
  void dispose() {
    unSavedImagePrefs.removeUnSavedImages();
    super.dispose();
  }

  Future<void> addObservation() async {
    try {
      int obsId = await this.db.addObservation(this.observation);
      await this
          .db
          .addImages(obsId, await unSavedImagePrefs.getUnSavedImages());
      unSavedImagePrefs.removeUnSavedImages();
    } catch (e) {}
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
              if (snapshot.hasData) {
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
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })),
        bottomNavigationBar: BottomNavigation(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: FloatingActionButton.extended(
                      elevation: 4.0,
                      label: const Text('保存'),
                      icon: const Icon(Icons.add),
                      backgroundColor: Colors.orange[700],
                      heroTag: 'save',
                      shape: StadiumBorder(
                        side: const BorderSide(color: Colors.white),
                      ),
                      // side: const BorderSide(color: Colors.green),
                      onPressed: () async {
                        await this.addObservation();
                        unSavedImagePrefs.removeUnSavedImages();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MenuPage()),
                        );
                      },
                    ))
              ],
            ),
            Column(
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
              ],
            ),
          ],
        )

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
        builder: (context) {
          return BottomSheetForm(
            setFormData: setFormData,
          );
        });
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
