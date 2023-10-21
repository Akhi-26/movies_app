import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/views/detailScreen.dart';

class carouselSlider extends StatelessWidget {
  const carouselSlider({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                DetailScreen(movie: snapshot.data[itemIndex])));
          },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 250,
                child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    "${snapshot.data[itemIndex].poster}"
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
            height: 400,
            viewportFraction: 0.75,
            autoPlay: true,
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            enlargeCenterPage: true));
  }
}
