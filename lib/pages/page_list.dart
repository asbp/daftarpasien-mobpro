import 'package:daftar_pasien/components/util_constants.dart';
import 'package:daftar_pasien/components/util_network.dart';
import 'package:daftar_pasien/models/model_pasien.dart';
import 'package:daftar_pasien/pages/page_input.dart';
import 'package:daftar_pasien/widgets/widget_pasien.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageList extends StatefulWidget {
  createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  NetworkUtil nutil;

  @override
  void initState() {
    super.initState();

    nutil = NetworkUtil();
  }

  json2List(dynamic val) =>
      (val as Iterable).map((json) => Pasien.fromJson(json)).toList();

  Future<List<Pasien>> loadPasien() async {
    return await nutil
        .get("${REST_URL}/pasien")
        .then((value) => json2List(value));
  }

  @override
  Widget build(BuildContext context) {
    print("Halo");
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Pasien"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => PageInput()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: loadPasien(),
          builder: (BuildContext ctx, AsyncSnapshot<List<Pasien>> data) {
            print(data.connectionState.toString());
            switch (data.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Text("Loading..."),
                );
              default:
                // ignore: missing_return
                if (data.hasError) {
                  return Text("Gagal!" + data.error.toString());
                } else if (data.hasData) {
                  List<Pasien> list = data.data;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list.map((e) => WidgetPasien(pasien: e)).toList(),
                  );
                }
            }
          }),
    );
  }
}
