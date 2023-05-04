import 'package:flutter/material.dart';
import 'package:money_watch/api/firebase.dart';

import '../model/spending_model.dart';

class SpendView extends StatefulWidget {
  SpendView({super.key, required this.spendTotal});
  final List<SpendingModel> spendTotal;

  @override
  State<SpendView> createState() => _SpendViewState();
}

class _SpendViewState extends State<SpendView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.spendTotal.length,
      itemBuilder: (context, index) {
        return Center(
          child: ListTile(
            title: Text('Category: ${widget.spendTotal[index].category}'),
            subtitle:
                Text('Amount: ${widget.spendTotal[index].amount.toString()}'),
          ),
        );
      },
    );
  }
}
