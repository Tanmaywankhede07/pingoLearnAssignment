import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn/ui/homepage/model/get_all_product_info.dart';
import 'package:pingolearn/utils/Dialogs.dart';

class ProductProvider with ChangeNotifier {
  GetAllProductInfo? _getAllProductInfo;
  bool _showDiscountedPrice = false;

  GetAllProductInfo? get getAllProductInfo => _getAllProductInfo;

  bool get showDiscountedPrice => _showDiscountedPrice;

  ProductProvider(BuildContext context) {
    _fetchRemoteConfig();
    getProductInfo(context);
  }

  Future<void> _fetchRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    _showDiscountedPrice = remoteConfig.getBool('showDiscountedPrice');
    notifyListeners();
  }

  Future<void> getProductInfo(BuildContext context) async {
    var dio = Dio();
    Dialogs.showLoader(context, "Please wait...");
    var response = await dio.request(
      'https://dummyjson.com/products',
      options: Options(method: 'GET'),
    );
    if (response.statusCode == 200) {
      await Dialogs.hideLoader(context);
      _getAllProductInfo = GetAllProductInfo.fromJson(response.data);
      notifyListeners();
    } else {
      await Dialogs.hideLoader(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('API failed: ${response.statusMessage}')));
    }
  }

  double calculateDiscountedPrice(num price, num discountPercentage) {
    final discountedPrice = price * (1 - discountPercentage / 100);
    return double.parse(discountedPrice.toStringAsFixed(2));
  }
}
