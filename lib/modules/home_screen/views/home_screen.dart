import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto_demo/modules/home_screen/controller/CoinController.dart';
import 'package:crypto_demo/modules/home_screen/models/CoinModel.dart';
import 'package:crypto_demo/modules/home_screen/views/components/coinsList/coinsListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../utils/constants.dart';
import 'components/connectivityCard/connectionCard.dart';

List<Coin> coinsList = [];
bool coinsFetched = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.mobile;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late CoinController coinController;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    coinController = Provider.of<CoinController>(context, listen: false);
    // coinController.refreshData();
    getCoins();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  getCoins() async {
    // if (_connectionStatus != ConnectivityResult.none) {
    //   coinController.refreshData();
    // }
    await coinController.getData();
    debugPrint(coinController.coinList.toString());
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                  color: kSecondaryTextColor,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Karan Kharode',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const CircleAvatar(
            foregroundImage: AssetImage('assets/images/jack_brown.png'),
            backgroundColor: kBackgroundColor,
            radius: 30,
          ),
        ],
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: const Alignment(0, -0.1),
          colors: [
            kBackgroundColor.withOpacity(0),
            kBackgroundColor,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (final icon in [
              FontAwesomeIcons.house,
              FontAwesomeIcons.chartColumn,
              FontAwesomeIcons.wallet,
              FontAwesomeIcons.gear,
            ])
              Icon(
                icon,
                color: icon == FontAwesomeIcons.house ? kPrimaryTextColor : kSecondaryColor,
              ),
          ],
        ),
      ),
    );
  }

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    // if (_connectionStatus != ConnectivityResult.none) {
    //   try {
    //     await coinController.refreshData();
    //     _refreshController.refreshCompleted();
    //   } catch (e) {
    //     coinController.getData();
    //   }
    // } else {
    //   _refreshController.refreshFailed();
    // }
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    // if (_connectionStatus != ConnectivityResult.none) {
    //   try {
    //     await coinController.refreshData();
    //     _refreshController.loadComplete();
    //   } catch (e) {
    //     coinController.getData();
    //     _refreshController.loadComplete();
    //   }
    // } else {
    //   _refreshController.loadFailed();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                      begin: const Alignment(0, 0.8),
                      end: Alignment.bottomCenter,
                      colors: [
                        kBackgroundColor,
                        kBackgroundColor.withOpacity(0),
                      ],
                    ).createShader(bounds),
                blendMode: BlendMode.dstATop,
                child: Consumer<CoinController>(builder: (context, coinProvider, child) {
                  debugPrint(coinProvider.cached.toString());
                  return ListView(
                    padding: const EdgeInsets.only(top: 64, bottom: 24),
                    children: [
                      header(),
                      (_connectionStatus != ConnectivityResult.none)
                          ? Container()
                          : Column(
                              children: const [
                                SizedBox(height: 26),
                                ConnectionCard(),
                              ],
                            ),
                      const SizedBox(height: 16),
                      (!coinProvider.cached)
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: Center(
                                child: Lottie.asset('assets/animation/searching.json',
                                    height: 150, width: 150),
                              ),
                            )
                          : CoinsListWidget(
                              coinProvider: coinProvider,
                            ),
                    ],
                  );
                })),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}
