import 'package:flutter/material.dart';
import 'package:kinoko_note/model/db.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart' as format;
import 'package:kinoko_note/components/bottom_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.observationId}) : super(key: key);
  final int observationId;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late AppDatabase db;
  late Directory? _imagePath;
  late List<ObservationWithImage> _observationWithImage;

  int activeIndex = 0;
  format.DateFormat _dateFormat = format.DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    db = AppDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: FutureBuilder<void>(
          // stream: this.db.observationWithImage(widget.observationId),
          future: Future.wait([
            getExternalStorageDirectory(),
            this.db.observationWithImage(widget.observationId)
          ]),
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              _imagePath = snapshot.data[0];
              _observationWithImage = snapshot.data[1];

              return Column(
                children: [
                  Card(
                    color: Colors.orange[50],
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      ListTile(
                        leading: Icon(Icons.label),
                        title: Text(
                          _observationWithImage[0].observation.name,
                        ),
                        subtitle: Text(
                            '観察日：${_dateFormat.format(_observationWithImage[0].observation.observation_date)}'),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CarouselSlider.builder(
                              options: CarouselOptions(
                                  initialPage: 0,
                                  viewportFraction: 1,
                                  enlargeCenterPage: true,
                                  onPageChanged: ((index, reason) =>
                                      setState(() {
                                        activeIndex = index;
                                      }))),
                              itemCount: _observationWithImage.length,
                              itemBuilder: (context, index, realIndex) {
                                final String path =
                                    '${_imagePath?.path}/${_observationWithImage[index].image.image_name}';
                                return buildImage(path, index);
                              }),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: buildIndicator(),
                          )
                        ],
                        // fit: StackFit.passthrough,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          textDirection: TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '観察項目1：.....',
                              // textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 20, //パディング２０
                            ),
                            Text(
                              '観察項目2：.....',
                              // textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      )
                    ]),
                    margin: EdgeInsets.all(30),
                    elevation: 10, // 影の離れ具合
                    shape: RoundedRectangleBorder(
                      // 枠線を変更できる
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60), // Card左上の角に丸み
                        bottomRight: Radius.elliptical(40, 20), //Card左上の角の微調整
                        // (x, y) -> (元の角から左にどれだけ離れているか, 元の角から上にどれだけ離れているか)
                      ),
                    ),
                  ),
                ],
                // fit: StackFit.expand,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })),
      bottomNavigationBar: BottomNavigation(),
    );
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
        count: _observationWithImage.length,
        effect: JumpingDotEffect(
            dotHeight: 16,
            dotWidth: 16,
            activeDotColor: Colors.green,
            dotColor: Colors.white),
      );
}
