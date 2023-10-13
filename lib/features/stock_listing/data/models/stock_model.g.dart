// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockModelAdapter extends TypeAdapter<StockModel> {
  @override
  final int typeId = 1;

  @override
  StockModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockModel(
      symbol: fields[0] as String,
      stockPrice: fields[1] as String,
      id: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StockModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.symbol)
      ..writeByte(1)
      ..write(obj.stockPrice)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
