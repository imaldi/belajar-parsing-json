import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task4/views/HalamanKamus.dart';

import '../Consts.dart';
import 'HalamanBerita.dart';
import 'HalamanGaleri.dart';
import 'HalamanTambahPegawai.dart';

class HalamanHome extends StatefulWidget {
  // final VoidCallback signOut;
  // HalamanHome(this.signOut);
  @override
  _HalamanHomeState createState() => _HalamanHomeState();
}

class _HalamanHomeState extends State<HalamanHome> {
  //tambahan method signout
  // signOut() async {
  //   setState(() {
  //     widget.signOut();
  //   });
  // }
  Future<List> getData() async {
    final response =
        await http.get("http://$URL/flutter-server/getBerita.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peternakan'),
          backgroundColor: Colors.brown,
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(
          //       Icons.exit_to_app,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       signOut();
          //     },
          //   )
          // ],
        ),
        body: Container(
            margin: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HalamanBerita()));
                      },
                      child: Container(
                          width: 50,
                          height: 50,
                          child: Center(child: Text('Berita'))),
                      color: Colors.brown,
                      textColor: Colors.white),
                  MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HalamanGaleri()));
                      },
                      child: Container(
                          width: 50,
                          height: 50,
                          child: Center(child: Text('Galeri'))),
                      color: Colors.brown,
                      textColor: Colors.white),
                  MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HalamanKamus()));
                      },
                      child: Container(
                          width: 50,
                          height: 50,
                          child: Center(child: Text('Kamus'))),
                      color: Colors.brown,
                      textColor: Colors.white),
                ],
              ),
            ])));
  }
}
