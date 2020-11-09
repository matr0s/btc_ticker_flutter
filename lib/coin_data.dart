import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '17671CDD-947F-48C7-B714-456F32FB41F1';
//const apiKey = '84715350-C3B2-4810-ABD1-B3844D04ECD7';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map cryptoMap = {};
    //INFO 5: Return a Map of the results instead of a single value.
    //INFO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    for (String cryptoCurrency in cryptoList) {
      String requestURL =
          '$coinAPIURL/$cryptoCurrency/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        //var lastPrice = decodedData['rate'];
        //var cryptoName = decodedData['asset_id_base'];
        cryptoMap.addAll({decodedData['asset_id_base']: decodedData['rate']});
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoMap;
  }
}
