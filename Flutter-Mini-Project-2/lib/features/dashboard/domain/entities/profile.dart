class Profile {
  String? key;
  String? name;
  String? jenisKelamin;
  String? tempat;
  String? tanggalLahir;
  String? jalan;
  String? provinsi;
  String? kokap;
  String? kec;
  String? kel;
  String? rt;
  String? rw;
  Profile({
    required this.key,
    required this.name,
    required this.jenisKelamin,
    required this.tempat,
    required this.tanggalLahir,
    required this.jalan,
    required this.provinsi,
    required this.kokap,
    required this.kec,
    required this.kel,
    required this.rt,
    required this.rw,
  });

  @override
  String toString() =>
      'Friends(key: $key, name: $name, jeniskelamin: $jenisKelamin, tempat: $tempat, tanggalLahir: $tanggalLahir, jalan: $jalan, provinsi: $provinsi, kokap: $kokap, kec: $kec, kel: $kel, rt: $rt, rw: $rw)';
}
