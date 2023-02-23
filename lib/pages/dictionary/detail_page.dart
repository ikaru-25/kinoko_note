import 'package:flutter/material.dart';
import 'package:kinoko_note/model/db.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:kinoko_note/pages/dictionary/list_page.dart';

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

              return Stack(
                children: [
                  CarouselSlider.builder(
                      options: CarouselOptions(
                          initialPage: 0,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          onPageChanged: ((index, reason) => setState(() {
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
                    // child: buildIndicator(),
                  )
                ],
                fit: StackFit.expand,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage()),
                );
              },
            )
          ],
        ),
      ),
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
}
