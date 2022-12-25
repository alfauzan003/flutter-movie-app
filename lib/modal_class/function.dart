import 'dart:convert';
import 'package:http/http.dart' as http;
import '/api/endpoints.dart';
import '/modal_class/credits.dart';
import '/modal_class/movie.dart';

Future<List<Movie>> fetchMovies(String api) async {
  MovieList movieList;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  movieList = MovieList.fromJson(decodeRes);
  return movieList.movies ?? [];
}

Future<Credits> fetchCredits(String api) async {
  Credits credits;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  credits = Credits.fromJson(decodeRes);
  return credits;
}
