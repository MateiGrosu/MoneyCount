import 'package:cloud_firestore/cloud_firestore.dart';

class SpendingModel {
  final String id;
  final String category;
  final double amount;

  SpendingModel(
      {required this.id, required this.category, required this.amount});

  factory SpendingModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return SpendingModel(
      id: doc.id,
      category: data['category'],
      amount: data['amount'],
    );
  }
}
