import 'dart:convert';

import 'package:http/http.dart' as http;

class Film {
  final String title;
  final String year;
  final String poster;
  final String imdbID;
  final String type;

  const Film({
    required this.title,
    required this.year,
    required this.poster,
    required this.imdbID,
    required this.type,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json["Title"],
      year: json["Year"],
      poster: json["Poster"],
      imdbID: json["imdbID"],
      type: json["Type"],
    );
  }
}

//Fonction qui permet de rechercher un film
class FilmRecherche {
  static Future<List<Film>> getFilm(filmRechercher) async {
    final url =
        Uri.parse('http://www.omdbapi.com/?s=$filmRechercher&apikey=f0710ff8');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map film = json.decode(response.body);

      var list = (film['Search'] as List)
          .map((item) => Film.fromJson(item))
          .toList();
      return list;
    } else {
      throw Exception("Une erreur est survenue !!!!");
    }
  }
}
