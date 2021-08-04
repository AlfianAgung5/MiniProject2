// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datadiri.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataDiriAdapter extends TypeAdapter<DataDiri> {
  @override
  final int typeId = 0;

  @override
  DataDiri read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataDiri(
      name: fields[0] as String,
      tempat: fields[1] as String,
      jalan: fields[2] as String,
      jenisKelamin: fields[3] as String,
      tanggalLahir: fields[4] as DateTime,
      provinsiKtp: fields[5] as String,
      kabupatenKtp: fields[6] as String,
      kecamatanKtp: fields[7] as String,
      desaKtp: fields[8] as String,
      rtKtp: fields[9] as String,
      rwKtp: fields[10] as String,
      provinsiRumah: fields[11] as String,
      kabupatenRumah: fields[12] as String,
      kecamatanRumah: fields[13] as String,
      desaRumah: fields[14] as String,
      rtRumah: fields[15] as String,
      rwRumah: fields[16] as String,
      jalanRumah: fields[17] as String,
      index: fields[18] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DataDiri obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.tempat)
      ..writeByte(2)
      ..write(obj.jalan)
      ..writeByte(3)
      ..write(obj.jenisKelamin)
      ..writeByte(4)
      ..write(obj.tanggalLahir)
      ..writeByte(5)
      ..write(obj.provinsiKtp)
      ..writeByte(6)
      ..write(obj.kabupatenKtp)
      ..writeByte(7)
      ..write(obj.kecamatanKtp)
      ..writeByte(8)
      ..write(obj.desaKtp)
      ..writeByte(9)
      ..write(obj.rtKtp)
      ..writeByte(10)
      ..write(obj.rwKtp)
      ..writeByte(11)
      ..write(obj.provinsiRumah)
      ..writeByte(12)
      ..write(obj.kabupatenRumah)
      ..writeByte(13)
      ..write(obj.kecamatanRumah)
      ..writeByte(14)
      ..write(obj.desaRumah)
      ..writeByte(15)
      ..write(obj.rtRumah)
      ..writeByte(16)
      ..write(obj.rwRumah)
      ..writeByte(17)
      ..write(obj.jalanRumah)
      ..writeByte(18)
      ..write(obj.index);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataDiriAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
