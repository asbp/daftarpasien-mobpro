import 'package:daftar_pasien/models/model_pasien.dart';
import 'package:flutter/material.dart';

class WidgetPasien extends StatelessWidget {
  Pasien pasien;

  WidgetPasien({this.pasien});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: ListTile(
            title: Text(pasien.namaPasien), subtitle: Text(pasien.noKartu.toString())),
        onTap: () {},
      ),
    );
  }
}
