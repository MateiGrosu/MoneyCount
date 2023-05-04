import 'package:flutter/material.dart';
import 'package:money_watch/api/firebase.dart';
import 'package:money_watch/model/spending_model.dart';

moneySpend(TextEditingController amount) async {
  var spendAmout = double.parse(amount.text);
  var total = await getMonthTotal('march');
  var newTotal = total - spendAmout;

  updateSpend(newTotal, spendAmout);
}

moneyEarn(TextEditingController amount) async {
  var earnAmount = double.parse(amount.text);
  var total = await getMonthTotal('march');
  var newTotal = total + earnAmount;

  updateEarn(newTotal, earnAmount);
}

getPercentage() async {
  var startTotal = await getStartMonthTotal('march');
  var newTotal = await getMonthTotal('march');
  double percentage = (((startTotal - newTotal) / startTotal));
  double result = double.parse(percentage.toStringAsFixed(2));
  print(result);
}

spendingsList() async {
  List<SpendingModel> spendingslist = await getSpend();
  print(spendingslist);
  return spendingslist;
}
