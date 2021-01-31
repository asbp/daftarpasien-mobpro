import 'package:daftar_pasien/components/util_constants.dart';
import 'package:daftar_pasien/components/util_network.dart';
import 'package:daftar_pasien/models/model_pasien.dart';

class UtilPasien {
  static final UtilPasien _singleton = UtilPasien._internal();
  static NetworkUtil _networkUtil;

  factory UtilPasien() {
    _networkUtil = NetworkUtil();

    return _singleton;
  }

  UtilPasien._internal();

  _list(dynamic val) =>
      (val as Iterable).map((json) => Pasien.fromJson(json)).toList();

  Future<List<Pasien>> getList() async {
    await Future.delayed(Duration(seconds: 2));

    dynamic a = await _networkUtil
        .get("$REST_URL/pasien");

    return _list(a);
  }

}