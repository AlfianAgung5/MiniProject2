import 'package:hive/hive.dart';
part 'datadiri.g.dart';

@HiveType(typeId: 0)
class DataDiri {
  @HiveField(0)
  String name;
  @HiveField(1)
  String tempat;
  @HiveField(2)
  String jalan;
  @HiveField(3)
  String jenisKelamin;
  @HiveField(4)
  String tanggalLahir;
  @HiveField(5)
  String provinsiKtp;
  @HiveField(6)
  String kabupatenKtp;
  @HiveField(7)
  String kecamatanKtp;
  @HiveField(8)
  String desaKtp;
  @HiveField(9)
  String rtKtp;
  @HiveField(10)
  String rwKtp;
  @HiveField(11)
  String provinsiRumah;
  @HiveField(12)
  String kabupatenRumah;
  @HiveField(13)
  String kecamatanRumah;
  @HiveField(14)
  String desaRumah;
  @HiveField(15)
  String rtRumah;
  @HiveField(16)
  String rwRumah;

  DataDiri({
    required this.name,
    required this.tempat,
    required this.jalan,
    required this.jenisKelamin,
    required this.tanggalLahir,
    required this.provinsiKtp,
    required this.kabupatenKtp,
    required this.kecamatanKtp,
    required this.desaKtp,
    required this.rtKtp,
    required this.rwKtp,
    required this.provinsiRumah,
    required this.kabupatenRumah,
    required this.kecamatanRumah,
    required this.desaRumah,
    required this.rtRumah,
    required this.rwRumah
  });
}
