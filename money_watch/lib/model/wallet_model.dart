import 'package:cloud_firestore/cloud_firestore.dart';

class Wallet {
  String month;
  double total;
  Map<String, double> spend;
  Map<String, double> earn;

  Wallet(
      {required this.month,
      required this.total,
      required this.spend,
      required this.earn});

  factory Wallet.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final spendData = data['spend'] as Map<String, dynamic>?;
    final earnData = data['earn'] as Map<String, dynamic>?;
    return Wallet(
      month: doc.id,
      total: data['total'] as double? ?? 0.0,
      spend: spendData?.cast<String, double>() ?? {},
      earn: earnData?.cast<String, double>() ?? {},
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'total': total,
      'spend': spend,
      'earn': earn,
    };
  }
}
