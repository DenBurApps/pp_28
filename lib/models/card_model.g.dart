// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankCardAdapter extends TypeAdapter<BankCard> {
  @override
  final int typeId = 0;

  @override
  BankCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankCard(
      balance: fields[0] as String,
      number: fields[1] as int,
      bank: fields[2] as String,
      name: fields[3] as String,
      cvv: fields[4] as int,
      id: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BankCard obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.balance)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.bank)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.cvv)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
