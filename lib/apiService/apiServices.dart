import 'dart:convert';
import 'package:movies_app/widgets/constants.dart';
import 'package:http/http.dart' as http;

import '../Model/movieModel.dart';

class Api {
  static const _trendingUrl =
      "https://omdbapi.com/?s=avengers&page=1&apikey=${Constants.apikey}";

  static const _mostWatchedUrl =
      "https://omdbapi.com/?s=batman&page=1&apikey=${Constants.apikey}";

  static const _blockBusterUrl =
      "https://omdbapi.com/?s=fast&page=1&apikey=${Constants.apikey}";

  static const _searchUrl =
      "https://omdbapi.com/?s=fast&page=1&apikey=${Constants.apikey}";

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)["Search"] as List;
      return decodeData.map((movie)=>Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception("Something Went Wrong");
    }
  }

  Future<List<Movie>> getMostWatchedMovies() async {
    final response = await http.get(Uri.parse(_mostWatchedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)["Search"] as List;
      return decodeData.map((movie)=>Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception("Something Went Wrong");
    }
  }

  Future<List<Movie>> getBlockBusterMovies() async {
    final response = await http.get(Uri.parse(_blockBusterUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)["Search"] as List;
      return decodeData.map((movie)=>Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception("Something Went Wrong");
    }
  }

  Future<List<Movie>> getSearchMovies() async {
    final response = await http.get(Uri.parse(_searchUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)["Search"] as List;
      return decodeData.map((movie)=>Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception("Something Went Wrong");
    }
  }
}

