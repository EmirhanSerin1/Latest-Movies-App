
class Movie {
  int id;

  // Bunların üçü detailste gelecek
  int? imdb_id;
  String? homepage;
  int? revenue;

  String? posterPath;
  bool adult;
  String? overview;
  String release_date;
  List<int>? genres_ids;
  String original_title;
  String original_language;
  String title;
  String? backdrop_path;
  num popularity;
  int vote_count;
  bool video;
  num vote_average;

  Movie(
    this.id,
    this.posterPath,
    this.adult,
    this.overview,
    this.release_date,
    this.genres_ids,
    this.original_title,
    this.original_language,
    this.title,
    this.backdrop_path,
    this.popularity,
    this.vote_count,
    this.video,
    this.vote_average,
  );
}
