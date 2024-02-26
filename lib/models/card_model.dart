import 'package:hive/hive.dart';
part 'card_model.g.dart';

@HiveType(typeId: 0)
class BankCard extends HiveObject {
  @HiveField(0)
  final String balance;
  @HiveField(1)
  final int number;
  @HiveField(2)
  final String bank;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final int cvv;
  @HiveField(5)
  final String id;

  BankCard({
    required this.balance,
    required this.number,
    required this.bank,
    required this.name,
    required this.cvv,
    required this.id,
  });
}
