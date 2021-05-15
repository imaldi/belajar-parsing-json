import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task4/model/Kamus.dart';

import '../Consts.dart';

class HalamanKamus extends StatefulWidget {
  @override
  _HalamanKamusState createState() => _HalamanKamusState();
}

class _HalamanKamusState extends State<HalamanKamus> {
  List<Kamus> _list = [];
  List<Kamus> _search = [];
  var loading = false;

  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });

    _list.clear();

    final response =
        await http.get("http://$URL/flutter-server/getKamus.php");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Kamus.formJson(i));
          _list.sort((a, b) => a.nama.toString().compareTo(b.nama.toString()));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.nama.toLowerCase().contains(text)) _search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Kamus'),backgroundColor: Colors.brown,),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.clear();
                      onSearch('');
                    },
                    icon: Icon(Icons.cancel, color: Colors.brown[300]),
                  ),
                ),
              ),
            ),
            Container(
              child: loading
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.brown,
                        ),
                      ),
                    )
                  : Expanded(
                      child: _search.length != 0 || controller.text.isNotEmpty
                          ? ListView.builder(
                              itemCount: _search.length,
                              itemBuilder: (context, i) {
                                final b = _search[i];
                                return Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DetailBerita(
                                            kamus: _search[i],
                                          );
                                        }));
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            b.nama,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Spacer(),
                                          Text("Detail")
                                         
                                        ],
                                      ),
                                    ));
                              },
                            )
                          : ListView.builder(
                              itemCount: _list.length,
                              itemBuilder: (context, i) {
                                final a = _list[i];
                                return Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DetailBerita(
                                            kamus: _list[i],
                                          );
                                        }));
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            a.nama,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Spacer(),
                                          Text("Detail")
                                         
                                        ],
                                      ),
                                    ));
                              },
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailBerita extends StatelessWidget {
  final Kamus kamus;

  DetailBerita({Key key, @required this.kamus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // elevation: 0,
        title: Text(
          'Detail',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        backgroundColor: Colors.brown,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(kamus.nama,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0)),
                      ),
                      Text(
                        kamus.pengertian,
                        style: TextStyle(
                                            fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        
        ],
      ),
    );
  }
}
