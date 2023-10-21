import 'package:flutter/material.dart';

import '../views/detailScreen.dart';

class mostWatchedTile extends StatelessWidget {
  const mostWatchedTile({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    DetailScreen(movie: snapshot.data[index])));
              },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 200,
                    width: 150,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      "${snapshot.data[index].poster}"
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
