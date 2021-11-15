import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_reproductor/reproductor.dart';

import 'modelos/canciones.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0C1027),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              imagenFondo(context),
              customAppBar(),
              descripcionArtista(context),
            ],
          ),
          Expanded(
            child: ListView(
              children: canciones
                  .asMap()
                  .map((index, cancion) =>
                      MapEntry(index, itemAudio(context, cancion, index + 1)))
                  .values
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
  }

Widget imagenFondo(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 2,
    decoration: BoxDecoration(
      color: const Color(0xff1C1e2C),
      image: DecorationImage(
        image: const AssetImage('assets/imgs/angeles.jpg'),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      ),
    ),
  );
}

Widget customAppBar() {
  return Container(
    height: 80,
    padding: const EdgeInsets.all(10),
    color: Colors.transparent,
    child: Row(
      children: const <Widget>[
        Icon(
          Icons.menu,
          color: Colors.white,
        ),
        Spacer(),
        Icon(
          Icons.search,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ],
    ),
  );
}

Widget descripcionArtista(BuildContext context) {
  return Positioned(
    top: MediaQuery.of(context).size.height / 3,
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Los angeles azules',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '30 Songs | + 1.3 M Favorites',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  print('Click');
                },
                child: Container(
                  height: 35,
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      Text(
                        'PLAY ALL',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {
                    print('Click download');
                  },
                  child: Container(
                    height: 35,
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.orange,
                        ),
                        Text(
                          'DOWNLOAD',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.orange),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget itemAudio(BuildContext context, Cancion cancion, int index) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReproductorPage(
                    canciones: canciones,
                    index: index - 1,
                  )));
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      child: Row(
        children: <Widget>[
          Text(
            index.toString().padLeft(2, "0"),
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 40,
            width: 40,
            child: Image.asset(
              cancion.imagen,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(cancion.titulo,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              Text(cancion.disco, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_downward,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.more_horiz, color: Colors.grey),
        ],
      ),
    ),
  );
}


