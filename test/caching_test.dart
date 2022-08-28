import 'dart:io';
import 'package:crypto_demo/mocks/mockCoinList.dart';
import 'package:crypto_demo/modules/home_screen/controller/CoinController.dart';
import 'package:crypto_demo/modules/home_screen/models/HiveCoinModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  setUp((() {
    Hive.init(Directory.current.path);
    Hive.registerAdapter(HiveCoinMODELAdapter(), override: true);
    Hive.openBox<HiveCoinMODEL>('coins');
  }));

  tearDown((() {
    Hive.box<HiveCoinMODEL>('coins').clear();
  }));

  test('Api fetch Test', () async {
    var result = await CoinController().fetchCoinsFromApi();
    expect(result, isInstanceOf<List<HiveCoinMODEL>>());
  });
  test("get empty data from db ", () async {
    var result = await CoinController().getDataFromDb();
    expect(result, isInstanceOf<List>());
  });

  test("change data & get data in db ", () async {
    await CoinController()
        .changeDataInDb(mockCoinListData.map((e) => HiveCoinMODEL.fromJson(e)).toList());
    var result = await CoinController().getDataFromDb();
    expect(result, isInstanceOf<List<HiveCoinMODEL>>());
  });
}
