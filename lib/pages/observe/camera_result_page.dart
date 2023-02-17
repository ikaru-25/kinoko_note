import 'package:flutter/material.dart';
import 'package:kinoko_note/components/bottom_sheet.dart';
import 'package:kinoko_note/pages/menu_page.dart';
import 'package:path/path.dart';
import '../../model/observation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:io';

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
  late Iobservation observation;
  double? _deviceWidth, _deviceHeight;

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
    // _imagePath = (getExternalStorageDirectory());
  }

  Future<int> addObservation() async {
    return this
        .db
        .addObservation(this.observation.name, basename(this.imagePath));
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            itemCount: 4,
            itemBuilder: (context, index, realIndex) {
              final path = imagePath;
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
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          child: Text('登録'),
          onPressed: () async {
            await this.addObservation();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'camera',
            onPressed: () => _showForm(context),
            child: Icon(Icons.add_a_photo),
          ),
          FloatingActionButton(
            heroTag: 'note',
            onPressed: () => _showForm(context),
            child: Icon(Icons.edit_note),
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
        margin: EdgeInsets.symmetric(horizontal: 13),
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
        count: 4,
        effect: JumpingDotEffect(
            dotHeight: 16,
            dotWidth: 16,
            activeDotColor: Colors.green,
            dotColor: Colors.white),
      );
}
