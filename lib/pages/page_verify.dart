import 'package:daftar_pasien/components/util_constants.dart';
import 'package:daftar_pasien/components/util_network.dart';
import 'package:daftar_pasien/models/model_pasien.dart';
import 'package:daftar_pasien/pages/page_list.dart';
import 'package:daftar_pasien/widgets/widget_boolean.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PageVerify extends StatefulWidget {
  Pasien pasien;

  PageVerify({@required this.pasien});

  createState() => _PageVerifyState();
}

class _PageVerifyState extends State<PageVerify> {
  final _formKey = GlobalKey<FormState>();
  NetworkUtil nutil;
  bool isLoading = false;
  bool _obscureText = true;

  String _username, _password;

  initState() {
    super.initState();

    nutil = NetworkUtil();
    _username = "";
    _password = "";
  }


  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Yakin untuk meninggalkan halaman ini?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<Response> sendData() async {
    print("SendData triggered!");
    Map<String, String> logins = {"email": _username, "password":_password};
    return await nutil.post("${REST_URL}/input", headers: logins, body: widget.pasien.toKirim())
    .catchError((err) {
      setState(() {
        isLoading = false;
      });
    })
    .then((value) {
      setState(() {
        isLoading = false;
      });

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => PageList()
          ),
            (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Pasien:");
    print(widget.pasien.namaPasien);
    print(widget.pasien.noKartu);
    print(widget.pasien.noBpjs);

    return WillPopScope(child:  Scaffold(
      appBar: AppBar(
        title: Text("Konfirmasi identitas Anda"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: SingleChildBooleanWidget(
          boolean: isLoading,
          ifFalse: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }else if(value.length < 5) {
                      return "Must be min. 5 character.";
                    }
                    setState(() {
                     _username = value;
                    });
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value.isEmpty)
                      return 'Please enter some text';
                    setState(() {
                      _password = value;
                    });
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _toggle();
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons
                            .visibility_off, color: Colors.red,),
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        Map<String, String> credentials = {"email": _username, "password":_password};
                        sendData();
                      }
                    },
                    child: Text('Submit'),
                  ),
                )
              ],
            ),
          ),
          ifTrue: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    ), onWillPop: _onWillPop);
  }
}
