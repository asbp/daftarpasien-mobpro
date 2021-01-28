import 'package:flutter/material.dart';
import 'package:mypasien/models/model_pasien.dart';

class WidgetPasien extends StatelessWidget {
  Pasien pasien;

  WidgetPasien({this.pasien});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: ListTile(
            title: Text(pasien.namaPasien), subtitle: Text(pasien.noKartu)),
        onTap: () {},
      ),
    );
  }
}
