import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pp_28/models/operation_model.dart';

import '../models/card_model.dart';

class DataBase {
  late Box<Operation> operationsBox;
  late Box<BankCard> bankCardsBox;

  init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(BankCardAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(OperationAdapter());
    }
    bankCardsBox = await Hive.openBox('cards');
    operationsBox = await Hive.openBox('operations');
  }

  Future<void> addOperation(Operation operation) => operationsBox.put(operation.id, operation);

  Future<void> addBankCard(BankCard card) => bankCardsBox.put(card.id, card);

  List<Operation> getAllOperations() => operationsBox.values.toList();

  List<BankCard> getAllBankCards() => bankCardsBox.values.toList();

  Future<void> deleteOperation(String id) => operationsBox.delete(id);

  Future<void> deleteBankCard(String id) => bankCardsBox.delete(id);
}
