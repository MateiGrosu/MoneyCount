import 'package:flutter/material.dart';
import 'package:money_watch/api/firebase.dart';

class SpendView extends StatefulWidget {
  SpendView({super.key, required this.spendTotal});
  final List spendTotal;

  @override
  State<SpendView> createState() => _SpendViewState();
}

class _SpendViewState extends State<SpendView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: widget.spendTotal.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.spendTotal[index].toString()),
          );
        },
      ),
    );
  }
}
