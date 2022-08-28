// ignore_for_file: non_constant_identifier_names, file_names

class Coin {
  String id; // ": "ETH",
  String currency; // ": "ETH",
  String symbol; // ": "ETH",
  String name; // ": "Ethereum",
  String
      logo_url; // ": "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/eth.svg",
  String status; // ": "active",
  String platform_currency; // ": "ETH",
  String price; // ": "1683.82988419",
  String price_date; // ": "2022-08-26T00:00:00Z",
  String price_timestamp; // ": "2022-08-26T13:32:00Z",
  String circulating_supply; // ": "122118667",
  String market_cap; // ": "205627061120",
  String market_cap_dominance; // ": "0.1901",
  String num_exchanges; // ": "546",
  String num_pairs; // ": "94688",
  String num_pairs_unmapped; // ": "84002",
  String first_candle; // ": "2015-08-07T00:00:00Z",
  String first_trade; // ": "2015-08-07T00:00:00Z",
  String first_order_book; // ": "2018-08-29T00:00:00Z",
  String rank; // ": "2",
  String rank_delta; // ": "0",
  String high; // ": "4159.15079678",
  String high_timestamp; // ": "2021-11-08T00:00:00Z",
  OneDay oneDay;
  ThirtyDay thirtyDay;

  Coin({
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
    required this.oneDay,
    required this.thirtyDay,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
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
        oneDay: OneDay.fromJson(json["1d"]),
        thirtyDay: ThirtyDay.fromJson(json["30d"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "currency": currency,
        "symbol": symbol,
        "name": name,
        "logo_url": logo_url,
        "status": status,
        "platform_currency": platform_currency,
        "price": price,
        "price_date": price_date,
        "price_timestamp": price_timestamp,
        "circulating_supply": circulating_supply,
        "market_cap": market_cap,
        "market_cap_dominance": market_cap_dominance,
        "num_exchanges": num_exchanges,
        "num_pairs": num_pairs,
        "num_pairs_unmapped": num_pairs_unmapped,
        "first_candle": first_candle,
        "first_trade": first_trade,
        "first_order_book": first_order_book,
        "rank": rank,
        "rank_delta": rank_delta,
        "high": high,
        "high_timestamp": high_timestamp,
        "1d": oneDay.toJson(),
        "30d": thirtyDay.toJson(),
      };
}

class OneDay {
  String volume; //": "25979058143.65",
  String price_change; //": "-30.30674281",
  String price_change_pct; //": "-0.0177",
  String volume_change; //": "1416354369.24",
  String volume_change_pct; //": "0.0577",
  String market_cap_change; //": "-3678726582.62",
  String market_cap_change_pct; //": "-0.0176"

  OneDay(
      {required this.volume,
      required this.price_change,
      required this.price_change_pct,
      required this.volume_change,
      required this.volume_change_pct,
      required this.market_cap_change,
      required this.market_cap_change_pct});

  factory OneDay.fromJson(Map<String, dynamic> json) =>  OneDay(
        volume: json["volume"],
        price_change: json["price_change"],
        price_change_pct: json["price_change_pct"],
        volume_change: json["volume_change"],
        volume_change_pct: json["volume_change_pct"],
        market_cap_change: json["market_cap_change"],
        market_cap_change_pct: json["market_cap_change_pct"],
      );

  Map<String, dynamic> toJson() => {
        "volume": volume,
        "price_change": price_change,
        "price_change_pct": price_change_pct,
        "volume_change": volume_change,
        "volume_change_pct": volume_change_pct,
        "market_cap_change": market_cap_change,
        "market_cap_change_pct": market_cap_change_pct,
      };
}

class ThirtyDay {
  String volume; //": "843483097305.37",
  String price_change; //": "80.41888632",
  String price_change_pct; //": "0.0502",
  String volume_change; //": "43785091811.63",
  String volume_change_pct; //": "0.0548",
  String market_cap_change; //": "10461364331.07",
  String market_cap_change_pct; //": "0.0536"

  ThirtyDay(
      {required this.volume,
      required this.price_change,
      required this.price_change_pct,
      required this.volume_change,
      required this.volume_change_pct,
      required this.market_cap_change,
      required this.market_cap_change_pct});

  factory ThirtyDay.fromJson(Map<String, dynamic> json) =>  ThirtyDay(
        volume: json["volume"],
        price_change: json["price_change"],
        price_change_pct: json["price_change_pct"],
        volume_change: json["volume_change"],
        volume_change_pct: json["volume_change_pct"],
        market_cap_change: json["market_cap_change"],
        market_cap_change_pct: json["market_cap_change_pct"],
      );

  Map<String, dynamic> toJson() => {
        "volume": volume,
        "price_change": price_change,
        "price_change_pct": price_change_pct,
        "volume_change": volume_change,
        "volume_change_pct": volume_change_pct,
        "market_cap_change": market_cap_change,
        "market_cap_change_pct": market_cap_change_pct,
      };
}
