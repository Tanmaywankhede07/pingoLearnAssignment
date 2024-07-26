import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;

class Utility {
  static double screenWidth(BuildContext context) {
    // print('${MediaQuery.of(context).size.width/1.55}');
    return MediaQuery.of(context).size.width;
  }

  static bool isWeb(BuildContext context) {
    return kIsWeb;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static log(var tag, var message) {
    // dev.log('\n\n*****************\n$tag\n$message\n*****************\n\n');
    print('\n\n*****************\n$tag\n$message\n*****************\n\n');
  }

  static var paddingSize15Box = const SizedBox(
    height: 15,
  );
  static var paddingSize10Box = const SizedBox(
    height: 10,
  );

  static var paddingSize30Box = const SizedBox(
    height: 30,
  );
}
