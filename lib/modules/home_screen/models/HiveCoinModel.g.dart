// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HiveCoinModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCoinMODELAdapter extends TypeAdapter<HiveCoinMODEL> {
  @override
  final int typeId = 0;

  @override
  HiveCoinMODEL read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCoinMODEL(
      id: fields[0] as String,
      currency: fields[1] as String,
      symbol: fields[2] as String,
      name: fields[3] as String,
      logo_url: fields[4] as String,
      status: fields[5] as String,
      platform_currency: fields[6] as String,
      price: fields[7] as String,
      price_date: fields[8] as String,
      price_timestamp: fields[9] as String,
      circulating_supply: fields[10] as String,
      market_cap: fields[11] as String,
      market_cap_dominance: fields[12] as String,
      num_exchanges: fields[13] as String,
      num_pairs: fields[14] as String,
      num_pairs_unmapped: fields[15] as String,
      first_candle: fields[16] as String,
      first_trade: fields[17] as String,
      first_order_book: fields[18] as String,
      rank: fields[19] as String,
      rank_delta: fields[20] as String,
      high: fields[21] as String,
      high_timestamp: fields[22] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCoinMODEL obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.currency)
      ..writeByte(2)
      ..write(obj.symbol)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.logo_url)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.platform_currency)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.price_date)
      ..writeByte(9)
      ..write(obj.price_timestamp)
      ..writeByte(10)
      ..write(obj.circulating_supply)
      ..writeByte(11)
      ..write(obj.market_cap)
      ..writeByte(12)
      ..write(obj.market_cap_dominance)
      ..writeByte(13)
      ..write(obj.num_exchanges)
      ..writeByte(14)
      ..write(obj.num_pairs)
      ..writeByte(15)
      ..write(obj.num_pairs_unmapped)
      ..writeByte(16)
      ..write(obj.first_candle)
      ..writeByte(17)
      ..write(obj.first_trade)
      ..writeByte(18)
      ..write(obj.first_order_book)
      ..writeByte(19)
      ..write(obj.rank)
      ..writeByte(20)
      ..write(obj.rank_delta)
      ..writeByte(21)
      ..write(obj.high)
      ..writeByte(22)
      ..write(obj.high_timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCoinMODELAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
