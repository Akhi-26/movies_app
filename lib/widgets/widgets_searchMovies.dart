import 'package:flutter/material.dart';

import '../views/detailScreen.dart';

class searchMoviesTile extends StatelessWidget {
  const searchMoviesTile({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 800,
      width: double.infinity,
      child: ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap:() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          DetailScreen(movie: snapshot.data[index])));
          },
              child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),),
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 80,
                      child: Image.network(fit: BoxFit.cover,"${snapshot.data[index].poster}"),
                    ),
                    const SizedBox(width: 20,),
                    Flexible(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${snapshot.data[index].title}",maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text("${snapshot.data[index].year}",style: const TextStyle(fontSize: 15),)
                        ],
                      ),
                    )
                  ],
                ),
                ),
            ),
          );
        },
      ),
    );
  }
}
