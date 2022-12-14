import 'package:flutter/material.dart';

import 'pageFilmDetail.dart';
import 'film.dart';

class PageListe extends StatelessWidget {
  const PageListe({Key? key, required this.valeurRecup}) : super(key: key);
  final String valeurRecup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:  Colors.red,
        centerTitle: true,
        title: const Text('OMDB app'),
      ),
      body: Center(
        child: FutureBuilder<List<Film>>(
          future: FilmRecherche.getFilm(valeurRecup),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final id = snapshot.data[index].imdbID;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pageFilmDetail(
                                  imdbID: id,
                                )),
                      );
                    },
                    child: Card(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      margin: const EdgeInsets.all(15),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        minVerticalPadding: 15,
                        title: Text(
                          snapshot.data[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data[index].year,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        trailing:
                            Image.network(snapshot.data[index].poster),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
