import 'package:daftar_pasien/models/model_pasien.dart';
import 'package:daftar_pasien/pages/page_verify.dart';
import 'package:flutter/material.dart';

class PageInput extends StatefulWidget {
  createState() => _PageInputState();
}

class _PageInputState extends State<PageInput> {
  Pasien p;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    p = Pasien();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Pasien"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Nama Pasien"),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }else if(value.length < 5) {
                    return "Must be min. 5 character.";
                  }
                  setState(() {
                    p.namaPasien = value;
                  });
                  return null;
                },

              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Nomor Kartu"),
                keyboardType: TextInputType.number,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }else if(value.length < 10) {
                    return "Must be min. 10 character.";
                  }
                  setState(() {
                    p.noKartu = value;
                  });
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Nomor BPJS"),
                keyboardType: TextInputType.number,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  } else if(value.length < 10) {
                    return "Must be min. 10 character.";
                  }
                  setState(() {
                    p.noBpjs = value;
                  });
                  return null;
                },
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      Route newRoute = MaterialPageRoute(builder: (context) => PageVerify(pasien: p,));
                      Navigator.pushReplacement(context, newRoute);
                    }
                  },
                  child: Text('Submit'),
                ),
              )
            ])),
      ),
    );
  }
}
