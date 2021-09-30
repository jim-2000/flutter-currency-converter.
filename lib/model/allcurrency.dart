//

import 'dart:convert';

Map<String, String> allcurrencyFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String allcurrencyFromJsonToJson(Map<String, String> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
