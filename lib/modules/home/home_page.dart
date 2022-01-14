import 'package:flutter/material.dart';
import 'package:flutter_cat_api/application/rest_client/dio/rest_client_dio.dart';
import 'package:flutter_cat_api/application/ui/cat_card.dart';
import 'package:flutter_cat_api/models/cat_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _loading = false;
  final _restClient = RestClientDio();
  var cats = List<CatModel>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    getCats();
  }

  Future getCats() async {
    setState(() {
      _loading = true;
    });

    var result = await _restClient.get(
      'images/search',
      queryParameters: {'limit': 10},
    );

    for (var i = 0; i < result.data.length; i++) {
      //debugPrint(result.data[i]?['id']);
      var item = result.data[i];

      cats.add(CatModel.fromMap(item));
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : cats.isEmpty
              ? const Center(child: Text('Não há dados para exibir...'))
              : Container(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: cats
                          .map(
                            (item) => CatCard(
                              height: item.height,
                              id: item.id,
                              url: item.url,
                              width: item.width,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
    );
  }
}
