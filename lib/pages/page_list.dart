import 'package:daftar_pasien/components/util_constants.dart';
import 'package:daftar_pasien/components/util_network.dart';
import 'package:daftar_pasien/components/util_pasien.dart';
import 'package:daftar_pasien/models/model_pasien.dart';
import 'package:daftar_pasien/pages/page_input.dart';
import 'package:daftar_pasien/widgets/widget_pasien.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageList extends StatefulWidget {
  createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  Future<List<Pasien>> _myFuture;
  UtilPasien rest;

  @override
  void initState() {
    super.initState();

    rest = UtilPasien();

    _refreshList();
  }

  Future<void> _refreshList() async {
    setState(() {
      _myFuture = rest.getList();
    });
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
      body: FutureBuilder<List<Pasien>>(
          future: _myFuture,
          builder: (BuildContext ctx, AsyncSnapshot<List<Pasien>> data) {
            print(data.connectionState.toString());

            switch (data.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Text("Loading..."),
                );
              default:
                // ignore: missing_return
                if (data.hasData) {
                  List<Pasien> list = data.data;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list.map((e) => WidgetPasien(pasien: e)).toList(),
                  );
                } else {
                  return Text("Gagal!\n" + data.error.toString());
                }
            }
          }),
    );
  }
}
