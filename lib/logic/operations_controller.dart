import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_28/models/card_model.dart';
import 'package:pp_28/models/operation_model.dart';

import '../services/data_base.dart';

class OperationController extends ChangeNotifier {
  final dataBase = GetIt.instance<DataBase>();


  BankCard? bankCard;
  Operation? operation;

  List<BankCard> bankCardHistory = [];
  List<Operation> operationHistory = [];

  void loadBankCardHistory()  {
    bankCardHistory = dataBase.getAllBankCards();
  }

  void loadOperationHistory()  {
    operationHistory = dataBase.getAllOperations();
  }

  OperationController() {
    _init();
  }

  Future<void> _init() async {
     loadBankCardHistory();
     loadOperationHistory();
  }
}