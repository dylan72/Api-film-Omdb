import 'dart:convert';

import 'package:http/http.dart' as http;

class Description {
  final String title;
  final String year;
  final String poster;
  final String genre;
  final String runtime;
  final String actors;
  final String plot;
  final String director;

  const Description({
    required this.title,
    required this.year,
    required this.poster,
    required this.genre,
    required this.runtime,
    required this.actors,
    required this.plot,
    required this.director,
  });

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      title: json["Title"],
      year: json["Year"],
      poster: json["Poster"],
      genre: json["Genre"],
      runtime: json["Runtime"],
      actors: json["Actors"],
      plot: json["Plot"],
      director: json["Director"],
    );
  }
}
//Fonction qui permet d'afficher le détail d'un film rechercher
class DescriptionDetail {
  static Future<Description> getDescription(id) async {
    final imdbID = Uri.parse('http://www.omdbapi.com/?i=$id&apikey=f0710ff8');
    final response = await http.get(imdbID);
    if (response.statusCode == 200) {
      Map description = json.decode(response.body);
      return Description.fromJson(json.decode(response.body));
    } else {
      throw Exception("Un problème est survenue");
    }
  }
}
