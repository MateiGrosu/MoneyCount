import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:money_watch/logic/wallet.dart';
import 'package:money_watch/model/wallet_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../api/firebase.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _monthTotal;
  var _startMonthTotal;

  var _chosenMonth;
  TextEditingController _amountSpendController = TextEditingController();
  TextEditingController _earnController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMonthTotal();
  }

  _getMonthTotal() async {
    final data = await getMonthTotal('march');
    final all = await getStartMonthTotal('march');
    setState(() {
      _monthTotal = data;
      _startMonthTotal = all;
    });
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (((_startMonthTotal - _monthTotal) / _startMonthTotal));
    double result = double.parse(percentage.toStringAsFixed(2));
    print(result);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          DropdownButton<String>(
            hint: Text('Select Month'),
            focusColor: Colors.white,
            value: _chosenMonth,
            style: const TextStyle(color: Colors.black),
            items: <String>[
              'march',
              'april',
              'may',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: ((value) {
              setState(() {
                _chosenMonth = value;
                print(value);
              });
            }),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Align(
            alignment: Alignment.center,
            child: CircularPercentIndicator(
              radius: 150.0,
              lineWidth: 30.0,
              percent: result,
              startAngle: 270,
              reverse: true,
              center: Text(" $_monthTotal / $_startMonthTotal"),
              progressColor: Colors.red,
              backgroundColor: Colors.green,
              //footer: const Text("Your bal"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text("Your balance is: $_monthTotal"),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey),
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("How much this time??"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 10,
                          actions: [
                            Column(
                              children: [
                                TextField(
                                  controller: _amountSpendController,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(90, 0, 0, 0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                                TextButton(
                                  child: const Text("Done"),
                                  onPressed: () {
                                    moneySpend(_amountSpendController);
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                          ],
                        );
                      }),
                  child: const Icon(Icons.remove),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4),
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey),
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("KEEP IT COMING"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 10,
                          actions: [
                            Column(
                              children: [
                                TextField(
                                  controller: _earnController,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(90, 0, 0, 0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                                TextButton(
                                  child: const Text("Done"),
                                  onPressed: () {
                                    moneyEarn(_earnController);
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                          ],
                        );
                      }),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
