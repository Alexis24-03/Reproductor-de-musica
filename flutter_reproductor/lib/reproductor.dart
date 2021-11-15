import 'dart:ui';
import 'package:flutter/material.dart';

import 'modelos/canciones.dart';

class ReproductorPage extends StatefulWidget {
  final List<Cancion> canciones;
  final int index;

  const ReproductorPage({Key? key, required this.canciones, required this.index}) : super(key: key);

  @override
  _ReproductorPageState createState() => _ReproductorPageState();
}

class _ReproductorPageState extends State<ReproductorPage> {
  double _valorBarra = 0;
  int indiceDisco = 0;

   @override
  void initState() {
    indiceDisco = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          imagenFondo(),
          filtro(),
          Column(
            children: <Widget>[
              customAppBar(),
              const SizedBox(
                height: 20,
              ),
              portada(),
              const SizedBox(
                height: 20,
              ),
              tituloCancion(),
              porgressBar(),
              const SizedBox(
                height: 5,
              ),
              botones(),
              const Spacer(),
              botonesOpciones(),
            ],
          ),
        ],
      ),
    );
  }

  Widget imagenFondo() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1c1e2c),
        image: DecorationImage(
          image:  AssetImage(widget.canciones[indiceDisco].imagenDisco),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.dstATop),
        ),
      ),
    );
  }

  Widget filtro() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        color: Colors.black.withOpacity(0),
      ),
    );
  }

  Widget customAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 15),
      // color: Colors.red,
      height: 100,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Los angeles azules',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        '30 Songs | + 1.5 M Favorites',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget portada() {
    return Container(
      height: 300,
      width: 300,
      child: Image.asset(
         widget.canciones[indiceDisco].imagenDisco,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget tituloCancion() {
    return Container(
      height: 50,
      child: Column(
        children: <Widget>[
          Text(
            widget.canciones[widget.index].titulo,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.canciones[widget.index].disco,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget porgressBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          Slider(
            value: _valorBarra,
            onChanged: onChanged,
            activeColor: Colors.orange,
            inactiveColor: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  '00:05',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  '-00:05',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onChanged(double value) {
    setState(() {
      _valorBarra = value;
    });
  }

  Widget botones() {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.fast_rewind,
            color: Colors.grey,
            size: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          Stack(
            alignment: const Alignment(0, 0),
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
              Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.orange,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.fast_forward,
            color: Colors.grey,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget botonesOpciones() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.bookmark_border,
            color: Colors.orange,
          ),
          Icon(
            Icons.shuffle,
            color: Colors.orange,
          ),
          Icon(
            Icons.repeat,
            color: Colors.orange,
          ),
          Icon(
            Icons.playlist_add,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
