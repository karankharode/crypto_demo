// ignore_for_file: file_names

import 'dart:convert';
import 'package:crypto_demo/modules/home_screen/models/HiveCoinModel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class CoinController with ChangeNotifier {
  List<HiveCoinMODEL> _coinList = [];
  bool fetched = false;
  bool cached = false;
  List<HiveCoinMODEL> get coinList => _coinList;

  Future<List<HiveCoinMODEL>> fetchCoinsFromApi() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.nomics.com/v1/currencies/ticker?key=11af86b8ec8ce0ce8884d3da9d33fb18817cbe89&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=10&page=1'));

    var response = await request.send();
    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      var coins = json.decode(jsonResponse) as List;
      _coinList = coins.map((coin) => HiveCoinMODEL.fromJson(coin)).toList();
    } else {
      debugPrint(response.reasonPhrase);
      _coinList = [];
    }
    fetched = true;
    notifyListeners();
    await changeDataInDb(_coinList);
    return _coinList;
  }

  Future<void> changeDataInDb(List<HiveCoinMODEL> coins) async {
    List<HiveCoinMODEL> hiveCoinMODELList = [];
    hiveCoinMODELList.addAll(coins);
    // await Hive.openBox<HiveCoinMODEL>('coins');
    await Hive.box<HiveCoinMODEL>('coins').clear();
    await Hive.box<HiveCoinMODEL>('coins').addAll(hiveCoinMODELList);
    _coinList = hiveCoinMODELList;
    cached = true;
    notifyListeners();
  }

  Future<List<HiveCoinMODEL>> getDataFromDb() async {
    final box = Hive.box<HiveCoinMODEL>('coins');
    _coinList = box.values.toList();
    cached = true;
    notifyListeners();
    return _coinList;
  }

  Future<void> getData() async {
    try {
      if (await hiveBoxExists()) {
        debugPrint("hive box exists");
        cached = true;
        await getDataFromDb();
      } else {
        debugPrint("hive box does not exist");
        cached = false;
        await fetchCoinsFromApi();
      }
    } catch (e) {
      debugPrint(e.toString());
      await fetchCoinsFromApi();
    }
  }

  Future<bool> hiveBoxExists() async {
    // Hive.openBox<HiveCoinMODEL>('coins');
    debugPrint("hive box exists: ${Hive.box<HiveCoinMODEL>('coins').values}");
    if (Hive.box<HiveCoinMODEL>('coins').isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> refreshData() async {
    await fetchCoinsFromApi();
  }

  Future<void> deleteData() async {
    // await Hive.openBox<HiveCoinMODEL>('coins');
    await Hive.box<HiveCoinMODEL>('coins').clear();
    cached = false;
    notifyListeners();
  }

  Future<void> deleteDataFromDb() async {
    // await Hive.openBox<HiveCoinMODEL>('coins');
    await Hive.box<HiveCoinMODEL>('coins').clear();
    cached = false;
    notifyListeners();
  }

  Future<void> deleteDataFromApi() async {
    await fetchCoinsFromApi();
  }

  Future<void> deleteDataFromBoth() async {
    await deleteDataFromDb();
    await deleteDataFromApi();
  }

  Future<void> deleteDataFromBothAndRefresh() async {
    await deleteDataFromBoth();
    await refreshData();
  }
}
