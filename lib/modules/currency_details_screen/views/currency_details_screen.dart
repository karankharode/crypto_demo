import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_demo/modules/currency_details_screen/views/components/trade_button.dart';
import 'package:crypto_demo/modules/home_screen/models/HiveCoinModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../mocks/models/trade.dart';
import '../../../utils/constants.dart';
import 'components/currency_chart.dart';
import 'components/trade_item.dart';

class CurrencyDetailsScreen extends StatelessWidget {
  final HiveCoinMODEL coin;
  final String imageTag;
  final List<double> priceHistory = [
    0.36995,
    0.37004,
    0.36675,
    0.36704,
    0.36527,
    0.36666,
    0.36921,
    0.36965,
    0.37171,
    0.37045,
    0.36949,
    0.37177,
    0.37435,
    0.39880,
    0.39704,
    0.40104,
    0.40498,
    0.40342,
    0.40015,
    0.39306,
    0.39383,
    0.39132,
    0.38928,
    0.38770,
  ];
  final List tradeHistory = [
    Trade(
      tradeDirection: TradeDirection.sell,
      date: '2022-06-03',
      amount: 450,
    ),
    Trade(
      tradeDirection: TradeDirection.sell,
      date: '2022-05-24',
      amount: 250,
    ),
    Trade(
      tradeDirection: TradeDirection.buy,
      date: '2022-03-12',
      amount: 700,
    ),
  ];

  CurrencyDetailsScreen({
    Key? key,
    required this.coin,
    required this.imageTag,
  }) : super(key: key);

  afficheImage(images) {
    // return SvgPicture.network(images, height: 35);
    var type = images.split('.').last;
    if (type == 'jpg' || type == 'png' || type == 'jpeg') {
      return Image(
        image: CachedNetworkImageProvider(images),
        height: 34,
      );
    } else {
      // try {
      //   _precache(images);
      // } catch (e) {}
      return SvgPicture(
        AdvancedNetworkSvg(
            images,
            useDiskCache: true,
            (theme) => (bytes, colorFilter, key) {
                  return svg.svgPictureDecoder(
                    bytes ?? Uint8List.fromList(const []),
                    false,
                    colorFilter,
                    key,
                    theme: const SvgTheme(currentColor: Colors.green, xHeight: 20),
                  );
                }, loadFailedCallback: () {
          return SvgPicture.asset(
            'plaseholder or error image',
            fit: BoxFit.scaleDown,
            width: 24,
            height: 24,
            color: Colors.red,
          );
        }),
      );
      // SvgPicture.network(images, height: 35);
    }
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              FontAwesomeIcons.chevronLeft,
            ),
          ),
          const Spacer(),
          // SizedBox(
          //   height: 32,
          //   width: 32,
          //   child: afficheImage(coin.logo_url),
          // ),
          // const SizedBox(width: 12),
          Text(
            coin.name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidStar,
              color: Color(0xFFFFD029),
            ),
          ),
        ],
      ),
    );
  }

  Widget price() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${coin.price} ${coin.platform_currency}",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
            decoration: BoxDecoration(
              color: coin.rank_delta == "0" ? const Color(0xFF409166) : const Color(0xFFC84747),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  coin.rank_delta == "0" ? FontAwesomeIcons.caretUp : FontAwesomeIcons.caretDown,
                  size: 16,
                ),
                const SizedBox(width: 2),
                Text(coin.rank),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tradingHistory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trading History',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          for (final trade in tradeHistory) ...[
            TradeItem(
              currencyCode: coin.symbol,
              trade: trade,
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(top: 50, bottom: 80),
            children: [
              appBar(context),
              const SizedBox(height: 36),
              Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kPrimaryColor,
                      kSecondaryColor,
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(1, -1),
                      color: Colors.white38,
                    ),
                    BoxShadow(
                      offset: Offset(-1, 1),
                      color: Color(0xFF182233),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Hero(tag: imageTag, child: 
                   afficheImage(coin.logo_url)),
                ),
              ),
              const SizedBox(height: 36),
              price(),
              const SizedBox(height: 36),
              CurrencyChart(priceHistory: priceHistory),
              const SizedBox(height: 36),
              tradingHistory(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TradeButton(tradeDirection: TradeDirection.sell),
                TradeButton(tradeDirection: TradeDirection.buy),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
