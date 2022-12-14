import 'package:flutter/material.dart';
import 'package:tp_mobilite_api/pageListe.dart';

void main() => runApp( Myapp ());

class Myapp  extends StatelessWidget {

  Myapp ({super.key});


  @override
  Widget build(BuildContext context) {
    const appTitle = 'OMDb app';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        backgroundColor:  Colors.black,

        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: Image.asset('assets/img/logoOMDBappbar.png'),
          centerTitle: true,
          title: const Text(
            'OMDb app',
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: MyCustomForm(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/logoOMDB.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),


    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  TextEditingController inputValue = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: inputValue,
            decoration:  InputDecoration(
                labelText: 'Recherchez un film',
                labelStyle: TextStyle(
                  color: Colors.white, //<-- SEE HERE
                ),
                hintText: 'Entrez un nom de film',
                hintStyle: TextStyle(
                  color: Colors.white, //<-- SEE HERE
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrez un nom de film';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 18.00,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PageListe(
                        valeurRecup: inputValue.text,
                      )));
                }
              },
              child: const Text('Rechercher',
                style: TextStyle(
                  color: Color(0xff000000),
                ),),
            ),
          ),
        ],
      ),
    );
  }
}