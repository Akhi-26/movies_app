import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets_blockMovieTile.dart';
import '../Model/movieModel.dart';
import '../Widgets/widget_appbar.dart';
import '../Widgets/widget_trendingMovies.dart';
import '../apiService/apiServices.dart';
import '../widgets/widget_mostWatchedTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> mostWatchedMovies;
  late Future<List<Movie>> blockBusterMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    mostWatchedMovies =Api().getMostWatchedMovies();
    blockBusterMovies = Api().getBlockBusterMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: appBar(),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Trending Right Now",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      child: FutureBuilder(
                          future: trendingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                  child: Text(
                                "Something went wrong!",
                                style:
                                    TextStyle(fontSize: 25, color: Colors.red),
                              ));
                            } else if (snapshot.hasData) {
                              return carouselSlider(snapshot: snapshot,);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Most Watched Movies",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      child: FutureBuilder(
                          future: mostWatchedMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                  child: Text(
                                    "Something went wrong!",
                                    style:
                                    TextStyle(fontSize: 25, color: Colors.red),
                                  ));
                            } else if (snapshot.hasData) {
                              return mostWatchedTile(snapshot: snapshot,);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Blockbuster Movies",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      child: FutureBuilder(
                          future: blockBusterMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                  child: Text(
                                    "Something went wrong!",
                                    style:
                                    TextStyle(fontSize: 25, color: Colors.red),
                                  ));
                            } else if (snapshot.hasData) {
                              return blockBusterTile(snapshot: snapshot,);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),
                    ),
                  ],
                )),
          )),
    );
  }
}
