// ignore_for_file: file_names

import 'package:crypto_demo/modules/home_screen/controller/CoinController.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'coinsListItem.dart';

class CoinsListWidget extends StatelessWidget {
  final CoinController coinProvider;
  const CoinsListWidget({Key? key, required this.coinProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: coinProvider.coinList.length != 0
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                for (final coin in coinProvider.coinList) ...[
                  CoinsListItem(coin: coin),
                  const SizedBox(height: 16),
                ],
              ],
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Center(
                  child: Lottie.asset('assets/animation/notfound.json', height: 150, width: 150)),
            ),
    );
  }
}
