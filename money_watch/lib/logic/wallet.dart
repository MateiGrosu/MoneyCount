import 'package:flutter/material.dart';
import 'package:money_watch/api/firebase.dart';

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
