import 'package:http/http.dart';
import 'dart:convert';

const List<String> currenciesList = [
  'UAH',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD';
const apiKey = '84715350-C3B2-4810-ABD1-B3844D04ECD7';

class CoinData {
  //TODO: Create your getCoinData() method here.
  Future getCoinData() async {
    Response getExchangeRate = await get(
        'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=84715350-C3B2-4810-ABD1-B3844D04ECD7');
    String data = getExchangeRate.body;
    return jsonDecode(data);
  }
}
