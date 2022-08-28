// ignore_for_file: file_names

import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_demo/modules/home_screen/models/HiveCoinModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../components/custom_icon.dart';
import '../../../../../utils/constants.dart';
import '../../../../currency_details_screen/views/currency_details_screen.dart';

class CoinsListItem extends StatelessWidget {
  final HiveCoinMODEL coin;

  const CoinsListItem({
    Key? key,
    required this.coin,
  }) : super(key: key);

  Widget title() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coin.symbol,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          coin.name,
          style: const TextStyle(
            fontSize: 16,
            color: kSecondaryTextColor,
          ),
        ),
      ],
    );
  }

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

  // Future<void> _precache(imageUrl) async {
  //   await precachePicture(
  //     NetworkPicture(
  //       SvgPicture.svgByteDecoderBuilder,
  //       imageUrl,
  //     ),
  //     null,
  //   );
  // }

  Widget price() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          coin.price,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              coin.rank_delta == "0" ? FontAwesomeIcons.caretUp : FontAwesomeIcons.caretDown,
              size: 16,
              color: kSecondaryTextColor,
            ),
            const SizedBox(width: 2),
            Text(
              coin.rank,
              style: const TextStyle(
                color: kSecondaryTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 74,
        color: kPrimaryColor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CustomIcon(icon: Hero(tag: coin.logo_url, child: afficheImage(coin.logo_url))),
                  const SizedBox(width: 16),
                  title(),
                  const Spacer(),
                  price(),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CurrencyDetailsScreen(
                      coin: coin,
                      imageTag: coin.logo_url,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
