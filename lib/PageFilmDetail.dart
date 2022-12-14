import 'package:flutter/material.dart';

import 'descriptionDetail.dart';

class pageFilmDetail extends StatelessWidget {
  const pageFilmDetail({Key? key, required this.imdbID}) : super(key: key);
  final String imdbID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('OMDB app'),
      ),
      body: Center(
        child: FutureBuilder<Description>(
            future: DescriptionDetail.getDescription(imdbID),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot);
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Text(
                                  snapshot.data.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    letterSpacing: 3.0,
                                    fontSize: 20.00,
                                  ),
                                ),
                                Text(
                                  snapshot.data.genre,
                                  style: const TextStyle(
                                    fontSize: 15.00,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  snapshot.data.year,
                                  style: const TextStyle(
                                    fontSize: 13.00,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  snapshot.data.runtime,
                                  style: const TextStyle(
                                    fontSize: 13.00,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          snapshot.data.poster,
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.red,
                          elevation: 10.0,
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Expanded(child:
                              Text(
                                snapshot.data.actors,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16.00,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data.plot,
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.00,
                                    fontStyle: FontStyle.italic,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  snapshot.data.director,
                                  style: const TextStyle(
                                    fontSize: 15.00,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
