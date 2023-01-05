import 'dart:convert';

import 'package:flutter/services.dart';

dynamic fetchRestaurants() async {
  String data = await rootBundle.loadString("assets/res.json");
  return jsonDecode(data);
}
