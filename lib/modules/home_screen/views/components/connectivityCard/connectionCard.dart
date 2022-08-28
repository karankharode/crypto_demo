// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'connection_background.dart';

class ConnectionCard extends StatelessWidget {
  const ConnectionCard({Key? key}) : super(key: key);

  Widget balanceText() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Offline',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "You don't have internet connection",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          // const Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 100,
        child: Stack(
          children: [
            const ConnectionBackground(),
            balanceText(),
          ],
        ),
      ),
    );
  }
}
