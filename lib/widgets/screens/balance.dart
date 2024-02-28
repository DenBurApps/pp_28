import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_28/helpers/image/image_helper.dart';
import 'package:pp_28/services/navigation/route_names.dart';

import '../../helpers/color_helper.dart';
import '../../logic/operations_controller.dart';
import '../../services/data_base.dart';
import '../../storage/storage_service.dart';

class BalanceView extends StatefulWidget {
  const BalanceView({super.key});

  @override
  State<BalanceView> createState() => _BalanceViewState();
}

class _BalanceViewState extends State<BalanceView> {
  final _storageService = GetIt.instance<StorageService>();
  final dataBase = GetIt.instance<DataBase>();
  final operationController = GetIt.instance<OperationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Text('Wallet',
                      style: Theme.of(context).textTheme.labelLarge),
                ),
                const SizedBox(height: 20),
                _BalanceCard(
                  balance: (_storageService.getInt(StorageKeys.budget) != null)
                      ? _storageService.getInt(StorageKeys.budget)!.toDouble()
                      : 0.0,
                  income: (_storageService.getInt(StorageKeys.income) != null)
                      ? _storageService.getInt(StorageKeys.income)!.toDouble()
                      : 0.0,
                  outcome: (_storageService.getInt(StorageKeys.outcome) != null)
                      ? _storageService.getInt(StorageKeys.outcome)!.toDouble()
                      : 0.0,
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteNames.editBalance);
                  },
                ),
                const SizedBox(height: 16),
                Text('Last operations',
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 8),
                for (final operation in dataBase.getAllOperations())
                  _OperationCard(
                    color: HexColor(operation.hexString),
                    icon: operation.icon,
                    operationName: operation.name,
                    date: operation.date,
                    amount: operation.amount.toString(),
                    symbol: operation.symbol,
                  ),
                const SizedBox(height: 110),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OperationCard extends StatelessWidget {
  const _OperationCard(
      {super.key,
      required this.icon,
      required this.operationName,
      required this.date,
      required this.amount,
      required this.color, required this.symbol});

  final String icon;
  final String operationName;
  final String date;
  final String amount;
  final Color color;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ImageHelper.getSvg(icon),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    operationName,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    ImageHelper.getSvg(SvgNames.calendarIcon),
                    const SizedBox(width: 5),
                    Text(
                      date,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black45),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Text('$symbol$amount\$'),
          ],
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard(
      {super.key,
      required this.balance,
      required this.income,
      required this.outcome,
      required this.onTap});

  final double balance;
  final double income;
  final double outcome;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 292,
        decoration: const BoxDecoration(
          color: Color(0xff1C1C1C),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total balance',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white54),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.45,
                    child: Text('\$${balance.toStringAsFixed(2)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.white)),
                  ),
                  const SizedBox(width: 5),
                  ImageHelper.getSvg(SvgNames.editIcon),
                ],
              ),
              const Divider(color: Colors.white54),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 135,
                      decoration: const BoxDecoration(
                        color: Color(0xff95CDC6),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      child: Text(
                                          '\$${income.toStringAsFixed(2)}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                    ),
                                    Text(
                                        '+${(income / balance * 100).toStringAsFixed(1)}%',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(color: Colors.black45)),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ImageHelper.getSvg(SvgNames.outcome),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text('Income',
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Container(
                      height: 135,
                      decoration: const BoxDecoration(
                        color: Color(0xffFF5F76),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                          '\$${outcome.toStringAsFixed(2)}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                    ),
                                    Text(
                                        '-${(outcome / balance * 100).toStringAsFixed(1)}%',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(color: Colors.black45)),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: ImageHelper.getSvg(SvgNames.income),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text('Outcome',
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
