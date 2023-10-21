import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets_searchMovies.dart';
import '../Model/movieModel.dart';
import '../Widgets/widget_mytctfiel.dart';
import '../apiService/apiServices.dart';

class SearchScreen extends StatefulWidget {
   const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Movie>> searchingMovies;

  @override
  void initState() {
    super.initState();
    searchingMovies = Api().getSearchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Search Movies",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child:  MyTxtField(),
              ),
              SizedBox(
                child: FutureBuilder(
                    future: searchingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text(
                              "Something went wrong!",
                              style:
                              TextStyle(fontSize: 25, color: Colors.red),
                            ));
                      } else if (snapshot.hasData) {
                        return searchMoviesTile(snapshot: snapshot,);
                      } else {
                        return const Center(
                            child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
