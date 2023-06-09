import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class MoreDetailsTile {
  final Icon icon;
  final String label;
  final PageRouteInfo<dynamic>? route; //TODO : will remove the null checking condition when all the routes are created

  const MoreDetailsTile({
    required this.icon,
    required this.label,
    required this.route,
  });
}
