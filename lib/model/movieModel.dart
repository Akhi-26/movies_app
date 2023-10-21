class Movie {
  String imdbId;
  String year;
  String poster;
  String title;

  Movie(
      {required this.imdbId,
      required this.year,
      required this.poster,
      required this.title});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        imdbId: json["imdbID"],
        year: json["Year"],
        poster: json["Poster"],
        title: json["Title"]);
  }
}
