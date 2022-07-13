import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/main.dart';
import 'package:flutter/material.dart';

void main() {
  initialSetup();
  locator<Config>().appFlavor = Flavor.uat;
  runApp(const MyApp());
}
