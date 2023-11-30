import 'package:flutter/material.dart';
import 'package:studi_kasus5/style.dart';
import 'package:studi_kasus5/list_item.dart';
import 'package:studi_kasus5/makanan.dart';
import 'makanan.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:studi_kasus5/http_helper.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpHelper api = HttpHelper();
  Future<List<Makanan>> fetchmakanan() async {
    final response = await api.getAPI();

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse
          .map((makanan) => new Makanan.fromJson(makanan))
          .toList();
    } else {
      throw Exception();
    }
  }

  late Future<List<Makanan>> futuremakanan;

  @override
  void initState() {
    futuremakanan = fetchmakanan();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Makanan>>(
        future: futuremakanan,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  var makanan = (snapshot.data as List<Makanan>)[index];
                  return ListItem(
                    makanan: makanan,
                    api: api,
                  );
                },
                itemCount: (snapshot.data as List<Makanan>).length);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}