import 'package:flutter/material.dart';

ListView totalSpendingList() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Row(
        children: [
          Text("\$\$\$\$"),
        ],
      );
    },
  );
}
