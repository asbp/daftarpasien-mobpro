// To parse this JSON data, do
//
//     final pasien = pasienFromJson(jsonString);

import 'dart:convert';

class Pasien {
  Pasien({
    this.id,
    this.idGolDarah,
    this.idPekerjaan,
    this.idAgama,
    this.idStatusPernikahan,
    this.idUic,
    this.idAlamatKecamatan,
    this.idAlamatKota,
    this.noKartu,
    this.noRm,
    this.noIdentitas,
    this.noBpjs,
    this.idJenisKelamin,
    this.namaIbu,
    this.tempatLahir,
    this.tglLahir,
    this.namaPasien,
    this.alamat,
    this.noTelepon,
    this.tglInput,
    this.tglDelete,
    this.tglEdit,
    this.agamaId,
    this.agamaAgama,
    this.agamaIdUic,
    this.agamaTglInput,
    this.agamaTglDelete,
    this.agamaTglEdit,
    this.golDarahId,
    this.namaGolDarah,
    this.golDarahIdUic,
    this.golDarahTglInput,
    this.golDarahTglDelete,
    this.golDarahTglEdit,
    this.jenisKelaminId,
    this.kodeJk,
    this.namaJk,
    this.jenisKelaminIdUic,
    this.jenisKelaminTglInput,
    this.jenisKelaminTglDelete,
    this.jenisKelaminTglEdit,
    this.pekerjaanId,
    this.namaPekerjaan,
    this.pekerjaanIdUic,
    this.pekerjaanTglInput,
    this.pekerjaanTglDelete,
    this.pekerjaanTglEdit,
    this.alamatKota,
    this.statusPernikahan,
    this.jenjangPendidikan,
  });

  int id;
  int idGolDarah;
  int idPekerjaan;
  int idAgama;
  int idStatusPernikahan;
  int idUic;
  dynamic idAlamatKecamatan;
  int idAlamatKota;
  String noKartu;
  String noRm;
  String noIdentitas;
  dynamic noBpjs;
  int idJenisKelamin;
  String namaIbu;
  String tempatLahir;
  DateTime tglLahir;
  String namaPasien;
  String alamat;
  String noTelepon;
  DateTime tglInput;
  dynamic tglDelete;
  dynamic tglEdit;
  int agamaId;
  String agamaAgama;
  int agamaIdUic;
  DateTime agamaTglInput;
  dynamic agamaTglDelete;
  dynamic agamaTglEdit;
  int golDarahId;
  String namaGolDarah;
  int golDarahIdUic;
  DateTime golDarahTglInput;
  dynamic golDarahTglDelete;
  dynamic golDarahTglEdit;
  int jenisKelaminId;
  String kodeJk;
  String namaJk;
  int jenisKelaminIdUic;
  DateTime jenisKelaminTglInput;
  dynamic jenisKelaminTglDelete;
  dynamic jenisKelaminTglEdit;
  int pekerjaanId;
  String namaPekerjaan;
  int pekerjaanIdUic;
  DateTime pekerjaanTglInput;
  dynamic pekerjaanTglDelete;
  DateTime pekerjaanTglEdit;
  dynamic alamatKota;
  dynamic statusPernikahan;
  dynamic jenjangPendidikan;

  factory Pasien.fromRawJson(String str) => Pasien.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        id: json["id"],
        idGolDarah: json["id_gol_darah"],
        idPekerjaan: json["id_pekerjaan"],
        idAgama: json["id_agama"],
        idStatusPernikahan: json["id_status_pernikahan"],
        idUic: json["id_uic"],
        idAlamatKecamatan: json["id_alamat_kecamatan"],
        idAlamatKota: json["id_alamat_kota"],
        noKartu: json["no_kartu"],
        noRm: json["no_rm"],
        noIdentitas: json["no_identitas"],
        noBpjs: json["no_bpjs"],
        idJenisKelamin: json["id_jenis_kelamin"],
        namaIbu: json["nama_ibu"],
        tempatLahir: json["tempat_lahir"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        namaPasien: json["nama_pasien"],
        alamat: json["alamat"],
        noTelepon: json["no_telepon"],
        tglInput: DateTime.parse(json["tgl_input"]),
        tglDelete: json["tgl_delete"],
        tglEdit: json["tgl_edit"],
        agamaId: json["agama_id"],
        agamaAgama: json["agama_agama"],
        agamaIdUic: json["agama_id_uic"],
        agamaTglInput: DateTime.parse(json["agama_tgl_input"]),
        agamaTglDelete: json["agama_tgl_delete"],
        agamaTglEdit: json["agama_tgl_edit"],
        golDarahId: json["gol_darah_id"],
        namaGolDarah: json["nama_gol_darah"],
        golDarahIdUic: json["gol_darah_id_uic"],
        golDarahTglInput: DateTime.parse(json["gol_darah_tgl_input"]),
        golDarahTglDelete: json["gol_darah_tgl_delete"],
        golDarahTglEdit: json["gol_darah_tgl_edit"],
        jenisKelaminId: json["jenis_kelamin_id"],
        kodeJk: json["kode_jk"],
        namaJk: json["nama_jk"],
        jenisKelaminIdUic: json["jenis_kelamin_id_uic"],
        jenisKelaminTglInput: DateTime.parse(json["jenis_kelamin_tgl_input"]),
        jenisKelaminTglDelete: json["jenis_kelamin_tgl_delete"],
        jenisKelaminTglEdit: json["jenis_kelamin_tgl_edit"],
        pekerjaanId: json["pekerjaan_id"],
        namaPekerjaan: json["nama_pekerjaan"],
        pekerjaanIdUic: json["pekerjaan_id_uic"],
        pekerjaanTglInput: DateTime.parse(json["pekerjaan_tgl_input"]),
        pekerjaanTglDelete: json["pekerjaan_tgl_delete"],
        pekerjaanTglEdit: DateTime.parse(json["pekerjaan_tgl_edit"]),
        alamatKota: json["alamat_kota"],
        statusPernikahan: json["status_pernikahan"],
        jenjangPendidikan: json["jenjang_pendidikan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_gol_darah": idGolDarah,
        "id_pekerjaan": idPekerjaan,
        "id_agama": idAgama,
        "id_status_pernikahan": idStatusPernikahan,
        "id_uic": idUic,
        "id_alamat_kecamatan": idAlamatKecamatan,
        "id_alamat_kota": idAlamatKota,
        "no_kartu": noKartu,
        "no_rm": noRm,
        "no_identitas": noIdentitas,
        "no_bpjs": noBpjs,
        "id_jenis_kelamin": idJenisKelamin,
        "nama_ibu": namaIbu,
        "tempat_lahir": tempatLahir,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "nama_pasien": namaPasien,
        "alamat": alamat,
        "no_telepon": noTelepon,
        "tgl_input": tglInput.toIso8601String(),
        "tgl_delete": tglDelete,
        "tgl_edit": tglEdit,
        "agama_id": agamaId,
        "agama_agama": agamaAgama,
        "agama_id_uic": agamaIdUic,
        "agama_tgl_input": agamaTglInput.toIso8601String(),
        "agama_tgl_delete": agamaTglDelete,
        "agama_tgl_edit": agamaTglEdit,
        "gol_darah_id": golDarahId,
        "nama_gol_darah": namaGolDarah,
        "gol_darah_id_uic": golDarahIdUic,
        "gol_darah_tgl_input": golDarahTglInput.toIso8601String(),
        "gol_darah_tgl_delete": golDarahTglDelete,
        "gol_darah_tgl_edit": golDarahTglEdit,
        "jenis_kelamin_id": jenisKelaminId,
        "kode_jk": kodeJk,
        "nama_jk": namaJk,
        "jenis_kelamin_id_uic": jenisKelaminIdUic,
        "jenis_kelamin_tgl_input": jenisKelaminTglInput.toIso8601String(),
        "jenis_kelamin_tgl_delete": jenisKelaminTglDelete,
        "jenis_kelamin_tgl_edit": jenisKelaminTglEdit,
        "pekerjaan_id": pekerjaanId,
        "nama_pekerjaan": namaPekerjaan,
        "pekerjaan_id_uic": pekerjaanIdUic,
        "pekerjaan_tgl_input": pekerjaanTglInput.toIso8601String(),
        "pekerjaan_tgl_delete": pekerjaanTglDelete,
        "pekerjaan_tgl_edit": pekerjaanTglEdit.toIso8601String(),
        "alamat_kota": alamatKota,
        "status_pernikahan": statusPernikahan,
        "jenjang_pendidikan": jenjangPendidikan,
      };
}
