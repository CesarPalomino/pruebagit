/*import 'dart:js';

import 'package:clases/lista.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coringa',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Brazzers'),
        ),
        body: HomePage()
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final List<Map<String, String>> _listElements = [
    {
      "title": "Star wars",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/tpHc9cS.jpg",
    },
    {
      "title": "Black widow",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/0NTTbFn.jpg",
    },
    {
      "title": "Frozen 2",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/noNCN3V.jpg",
    },
    {
      "title": "El Bromas",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/trdzMAl.jpg",
    },
  ];

Future<void> _showSelectionDialog(String title, BuildContext ctx ) async {
  await showDialog(builder: (context){
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10),)),
    title: Text("Seleccionado"),
    content: Text("Elemento seleccionado: $title"),
    actions: <Widget>[
      FlatButton(
        child: Text("Cerrar"),
        onPressed: (){
          Navigator.of(context).pop();
        },
      )
    ],
  )
  });
}




  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(decoration: BoxDecoration(color: Colors.blue),
      ),
      Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text("Seleccione sus pelicula:",style: TextStyle(color: Colors.white, fontSize: 24),),
        ),
        Container(
          height: MediaQuery.of(context).size.height/4,

          child: ListView.builder(
            scrollDirection: ,//falta aqui alaverga
            itemCount: _listElements.length,
            itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                _showSelectionDialog(_listElements[index]["title"], context);
              },
              child: ListItem(content: _listElements[index],));
           },
          ),
        )
      ],)
    ],
    );
  }
}

import 'dart:js';

import 'package:clases/second.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruteo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child:MaterialButton(
              child: Text("Next Page",
              style: TextStyle(
                color: Colors.white,
              )
              ),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return SecondPage();
                  })
              );
              
            }
            ),
          ),
        ),
      ),
    );
  }
}
*/

/*import 'package:clases/route_generator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruteo',
      initialRoute: "/",
      // home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class PageOne extends StatelessWidget {
  String _params = "hola desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PageOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Next page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.blue,
            onPressed: () {
              _openSecondPage(context);
            },
          ),
        ),
      ),
    );
  }

  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    ).then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );

    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  }
}*/

import 'package:clases/route_generator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruteo',
      initialRoute: "/",
      // home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class PageOne extends StatefulWidget {
  PageOne({
    Key key,
  }) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String _callBackParams;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("$_callBackParams"),
            Container(
              child: MaterialButton(
                child: Text(
                  "Next page",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () {
                  //_openSecondPage(context);
                  _showAlertDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showAlertDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (context) {
          TextEditingController _textController = TextEditingController();

          return AlertDialog(
            title: Text("Add data"),
            content: TextField(
              controller: _textController,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "Ingrese palabra",
                hintText: "Palabra",
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text("Siguiente"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await Navigator.of(context)
                      .pushNamed(
                    "/secondPage",
                    arguments: _textController.text,
                  )
                      .then(
                    (response) {
                      _callBackParams = response;
                    },
                  );
                },
              ),
              RaisedButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
            ],
          );
        });
  }
}
