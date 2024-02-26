import 'dart:ui';

import 'package:hive/hive.dart';
part 'operation_model.g.dart';

@HiveType(typeId: 1)
class Operation extends HiveObject {
  @HiveField(0)
  final int amount;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String icon;
  @HiveField(4)
  final String id;
  @HiveField(5)
  final String symbol;
  @HiveField(6)
  final Color color;

  Operation( {
    required this.amount,
    required this.name,
    required this.date,
    required this.icon,
    required this.id,
    required this.symbol,
    required this.color,
  });
}