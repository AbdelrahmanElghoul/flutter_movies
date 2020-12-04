class Movie{
  String title;
  String id;
  String originalTitle;
  String posterURL;
  String language;
  String date;
  String overview;
  bool adults;
  String rate;

  Movie.fromJson(Map<String,dynamic> json)
      : title = json['title'],
        originalTitle = json['original_title'],
        id = json['id'].toString(),
        posterURL = json['poster_path'].toString(),
        language = json['original_language'].toString(),
        date = json['release_date'].toString(),
        overview = json['overview'].toString(),
        adults = json['adult'],
        rate = json['vote_average'].toString()
  ;

}