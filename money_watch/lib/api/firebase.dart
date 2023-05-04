import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_watch/model/wallet_model.dart';

import '../model/spending_model.dart';

var firestore = FirebaseFirestore.instance.collection("wallet");
List<dynamic> listId = [];
List<dynamic> spendList = [];

getListID() async {
  await firestore.get().then((value) => value.docs.forEach((element) {
        listId.add(element.reference.id);
      }));
  print(listId);
}

Future<double> getStartMonthTotal(String month) async {
  final docRef = firestore.doc("$month");
  final data = await docRef.get().then((DocumentSnapshot doc) {
    return doc.data() as Map<String, dynamic>;
  });
  double total = data['startTotal'] ?? 0.0;
  return data['startTotal'] as double;
}

Future<double> getMonthTotal(String month) async {
  final docRef = firestore.doc("$month");
  final data = await docRef.get().then((DocumentSnapshot doc) {
    Wallet.fromFirestore(doc);
    return doc.data() as Map<String, dynamic>;
  });
  double total = data['total'] ?? 0.0;
  return data['total'] as double;
}

updateSpend(double total, double amount) async {
  updateTotal(total);
  final spend = <String, dynamic>{
    'category': "groceries",
    'amount': amount,
  };
  firestore
      .doc('march')
      .collection('spendings')
      .add(spend)
      .then((DocumentReference doc) => print('Spend added: $amount'));
}

updateEarn(double newTotal, double amount) {
  updateTotal(newTotal);
  final earn = <String, dynamic>{
    'category': "stonks",
    'amount': amount,
  };
  firestore
      .doc('march')
      .collection('earnings')
      .add(earn)
      .then((value) => print('Earn added: $amount'));
}

updateTotal(total) {
  final data = {"total": total};
  firestore.doc('march').set(data, SetOptions(merge: true));
}

getSpend() async {
  List<SpendingModel> spendList = [];

  var snapshot = await firestore.doc('march').collection('spendings').get();
  for (DocumentSnapshot doc in snapshot.docs) {
    var data = SpendingModel.fromFirestore(doc);
    spendList.add(data);
  }

  return spendList;
}
