import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'UAH';

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newListItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newListItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker iOsPicker() {
    List<Text> pickerList = [];
    for (String currency in currenciesList) {
      pickerList.add(Text(currency));
    }

    return CupertinoPicker(
      useMagnifier: true,
      magnification: 1.3,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOsPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}
