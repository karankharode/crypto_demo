// ignore_for_file: non_constant_identifier_names, file_names

import 'package:crypto_demo/modules/home_screen/models/CoinModel.dart';
import 'package:hive/hive.dart';

part 'HiveCoinModel.g.dart';

@HiveType(typeId: 0)
class HiveCoinMODEL {
  @HiveField(0)
  String id; // ": "ETH",
  @HiveField(1)
  String currency; // ": "ETH",
  @HiveField(2)
  String symbol; // ": "ETH",
  @HiveField(3)
  String name; // ": "Ethereum",
  @HiveField(4)
  String
      logo_url; // ": "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/eth.svg",
  @HiveField(5)
  String status; // ": "active",
  @HiveField(6)
  String platform_currency; // ": "ETH",
  @HiveField(7)
  String price; // ": "1683.82988419",
  @HiveField(8)
  String price_date; // ": "2022-08-26T00:00:00Z",
  @HiveField(9)
  String price_timestamp; // ": "2022-08-26T13:32:00Z",
  @HiveField(10)
  String circulating_supply; // ": "122118667",
  @HiveField(11)
  String market_cap; // ": "205627061120",
  @HiveField(12)
  String market_cap_dominance; // ": "0.1901",
  @HiveField(13)
  String num_exchanges; // ": "546",
  @HiveField(14)
  String num_pairs; // ": "94688",
  @HiveField(15)
  String num_pairs_unmapped; // ": "84002",
  @HiveField(16)
  String first_candle; // ": "2015-08-07T00:00:00Z",
  @HiveField(17)
  String first_trade; // ": "2015-08-07T00:00:00Z",
  @HiveField(18)
  String first_order_book; // ": "2018-08-29T00:00:00Z",
  @HiveField(19)
  String rank; // ": "2",
  @HiveField(20)
  String rank_delta; // ": "0",
  @HiveField(21)
  String high; // ": "4159.15079678",
  @HiveField(22)
  String high_timestamp; // ": "2021-11-08T00:00:00Z",
  // @HiveField(23)
  // String oneDay;
  // @HiveField(24)
  // ThirtyDay thirtyDay;

  HiveCoinMODEL({
    required this.id,
    required this.currency,
    required this.symbol,
    required this.name,
    required this.logo_url,
    required this.status,
    required this.platform_currency,
    required this.price,
    required this.price_date,
    required this.price_timestamp,
    required this.circulating_supply,
    required this.market_cap,
    required this.market_cap_dominance,
    required this.num_exchanges,
    required this.num_pairs,
    required this.num_pairs_unmapped,
    required this.first_candle,
    required this.first_trade,
    required this.first_order_book,
    required this.rank,
    required this.rank_delta,
    required this.high,
    required this.high_timestamp,
    // required this.oneDay,
    // this.thirtyDay
  });

  factory HiveCoinMODEL.fromCoin(Coin coin) => HiveCoinMODEL(
        id: coin.id,
        currency: coin.currency,
        symbol: coin.symbol,
        name: coin.name,
        logo_url: coin.logo_url,
        status: coin.status,
        platform_currency: coin.platform_currency,
        price: coin.price,
        price_date: coin.price_date,
        price_timestamp: coin.price_timestamp,
        circulating_supply: coin.circulating_supply,
        market_cap: coin.market_cap,
        market_cap_dominance: coin.market_cap_dominance,
        num_exchanges: coin.num_exchanges,
        num_pairs: coin.num_pairs,
        num_pairs_unmapped: coin.num_pairs_unmapped,
        first_candle: coin.first_candle,
        first_trade: coin.first_trade,
        first_order_book: coin.first_order_book,
        rank: coin.rank,
        rank_delta: coin.rank_delta,
        high: coin.high,
        high_timestamp: coin.high_timestamp,
        // oneDay: json.encode(coin.oneDay),
        // thirtyDay: coin.thirtyDay,
      );
  factory HiveCoinMODEL.fromJson(Map<String, dynamic> json) => HiveCoinMODEL(
        id: json["id"],
        currency: json["currency"],
        symbol: json["symbol"],
        name: json["name"],
        logo_url: json["logo_url"],
        status: json["status"],
        platform_currency: json["platform_currency"],
        price: json["price"],
        price_date: json["price_date"],
        price_timestamp: json["price_timestamp"],
        circulating_supply: json["circulating_supply"],
        market_cap: json["market_cap"],
        market_cap_dominance: json["market_cap_dominance"],
        num_exchanges: json["num_exchanges"],
        num_pairs: json["num_pairs"],
        num_pairs_unmapped: json["num_pairs_unmapped"],
        first_candle: json["first_candle"],
        first_trade: json["first_trade"],
        first_order_book: json["first_order_book"],
        rank: json["rank"],
        rank_delta: json["rank_delta"],
        high: json["high"],
        high_timestamp: json["high_timestamp"],
        // oneDay: json["oneDay"],
        // thirtyDay: json["thirtyDay"],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['currency'] = currency;
    data['symbol'] = symbol;
    data['name'] = name;
    data['logo_url'] = logo_url;
    data['status'] = status;
    data['platform_currency'] = platform_currency;
    data['price'] = price;
    data['price_date'] = price_date;
    data['price_timestamp'] = price_timestamp;
    data['circulating_supply'] = circulating_supply;
    data['market_cap'] = market_cap;
    data['market_cap_dominance'] = market_cap_dominance;
    data['num_exchanges'] = num_exchanges;
    data['num_pairs'] = num_pairs;
    data['num_pairs_unmapped'] = num_pairs_unmapped;
    data['first_candle'] = first_candle;
    data['first_trade'] = first_trade;
    data['first_order_book'] = first_order_book;
    data['rank'] = rank;
    data['rank_delta'] = rank_delta;
    data['high'] = high;
    data['high_timestamp'] = high_timestamp;
    // if (oneDay != null) {
    //   data['oneDay'] = json.decode(oneDay);
    // }
    // if (thirtyDay != null) {
    //   data['thirtyDay'] = thirtyDay.toJson();
    // }
    return data;
  }

  @override
  String toString() {
    return 'HiveCoinMODEL{id: $id, currency: $currency, symbol: $symbol, name: $name, logo_url: $logo_url, status: $status, platform_currency: $platform_currency, price: $price, price_date: $price_date, price_timestamp: $price_timestamp, circulating_supply: $circulating_supply, market_cap: $market_cap, market_cap_dominance: $market_cap_dominance, num_exchanges: $num_exchanges, num_pairs: $num_pairs, num_pairs_unmapped: $num_pairs_unmapped, first_candle: $first_candle, first_trade: $first_trade, first_order_book: $first_order_book, rank: $rank, rank_delta: $rank_delta, high: $high, high_timestamp: $high_timestamp}';
  }
}
