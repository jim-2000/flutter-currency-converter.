import 'package:currency_converter/model/allcurrency.dart';
import 'package:currency_converter/model/rates.dart';
import 'package:http/http.dart' as http;

//
String keY = "57b277a775ec431fb6a61343a5c0568b";
//
Future<RatesModel> fetchrates() async {
  var response = await http.get(
      Uri.parse("https://openexchangerates.org/api/latest.json?app_id=" + keY));
  final result = ratesModelFromJson(response.body);
  const kk = '';
  // print(result.rates);
  return result;
}

//
Future<Map> fetchCurryncy() async {
  var response = await http.get(Uri.parse(
      "https://openexchangerates.org/api/currencies.json?app_id=" + keY));
  final allCurrencies = allcurrencyFromJson(response.body);
  return allCurrencies;
}
//
/*









*/

String convertusd(Map exchangeRates, String usd, String currency) {
  var output =
      ((exchangeRates[currency] * double.parse(usd)).toStringAsFixed(2))
          .toString();
  return output.toString();
}
//

String convertany(Map exchangeRates, String amount, String currencybase,
    String currencyfinal) {
  String output = (double.parse(amount) /
          exchangeRates[currencybase] *
          exchangeRates[currencyfinal])
      .toStringAsFixed(2)
      .toString();

  return output;
}
