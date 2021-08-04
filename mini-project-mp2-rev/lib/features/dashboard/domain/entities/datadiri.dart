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
  DateTime tanggalLahir;
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
  @HiveField(17)
  String jalanRumah;
  @HiveField(18)
  int? index;

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
      required this.rwRumah,
      required this.jalanRumah,
      this.index
      });

  @override
  String toString() {
    return 'DataDiri(name: $name, tempat: $tempat, jalan: $jalan, jenisKelamin: $jenisKelamin, tanggalLahir: $tanggalLahir, provinsiKtp: $provinsiKtp, kabupatenKtp: $kabupatenKtp, kecamatanKtp: $kecamatanKtp, desaKtp: $desaKtp, rtKtp: $rtKtp, rwKtp: $rwKtp, provinsiRumah: $provinsiRumah, kabupatenRumah: $kabupatenRumah, kecamatanRumah: $kecamatanRumah, desaRumah: $desaRumah, rtRumah: $rtRumah, rwRumah: $rwRumah, jalanRumah: $jalanRumah, index: $index)';
  }
}
