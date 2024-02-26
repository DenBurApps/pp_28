import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../helpers/image/image_helper.dart';
import '../../logic/operations_controller.dart';
import '../../services/data_base.dart';
import '../../services/navigation/route_names.dart';
import '../../storage/storage_service.dart';

class EditBalanceView extends StatefulWidget {
  EditBalanceView({super.key});

  @override
  State<EditBalanceView> createState() => _EditBalanceViewState();
}

class _EditBalanceViewState extends State<EditBalanceView> {
  final dataBase = GetIt.instance<DataBase>();
  final operationController = GetIt.instance<OperationController>();
  final _storageService = GetIt.instance<StorageService>();
  int _budget = 0;

  final TextEditingController _balanceController = TextEditingController();

  void _editBalance() {
    setState(() {
      _budget = int.parse(_balanceController.text);
      _storageService.setInt(StorageKeys.budget, _budget);
    });
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    dataBase.init();
  }

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
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await Navigator.of(context).pushNamed(RouteNames.homeMenu);
                        setState(() {});
                      },
                      icon: ImageHelper.getSvg(SvgNames.backIcon),
                    ),
                    Text('Wallet',
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(width: 50),
                  ],
                ),
                const SizedBox(height: 10),
                _BalanceCard(
                  balance: (_storageService.getInt(StorageKeys.budget) != null)
                      ? _storageService.getInt(StorageKeys.budget)!.toDouble()
                      : 0.0,
                  onEditBalanceTap: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: SizedBox(
                            height: 300,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const SizedBox(width: 30),
                                      const Spacer(),
                                      const Text('Monthly budget'),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(Icons.close_rounded))
                                    ],
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Edit monthly budget',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      LengthLimitingTextInputFormatter(9),
                                    ],
                                    controller: _balanceController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black54, width: 1.0),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
                                      ),
                                      hintText: 'Enter amount',
                                    ),
                                  ),
                                  const Spacer(),
                                  ValueListenableBuilder<TextEditingValue>(
                                      valueListenable: _balanceController,
                                      builder: (context, value, child) {
                                        return ElevatedButton(
                                          onPressed: () {
                                            (_balanceController.text.isNotEmpty)
                                                ? _editBalance()
                                                : null;
                                            setState(() {});
                                          },
                                          child: Text('Save',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                      color: Colors.white)),
                                        );
                                      }),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  onStatisticsTap: () {},
                ),
                const SizedBox(height: 16),
                Text('Add operations',
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 16),
                _TransactionsButtons(
                  onIncomeTap: () {
                    // operationController.isIncome = true;
                    Navigator.of(context).pushNamed(RouteNames.income);
                  },
                  onOutcomeTap: () {
                    // operationController.isIncome = false;
                    Navigator.of(context).pushNamed(RouteNames.outcome);
                  },
                ),
                const SizedBox(height: 16),
                Text('Last operations',
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 16),
                for (final operation in dataBase.getAllOperations())
                  _OperationCard(
                    icon: operation.icon,
                    operationName: operation.name,
                    date: operation.date,
                    onEditOperationTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteNames.editOperations);
                    },
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OperationCard extends StatefulWidget {
  const _OperationCard({
    super.key,
    required this.icon,
    required this.operationName,
    required this.date,
    required this.onEditOperationTap,
  });

  final String icon;
  final String operationName;
  final String date;
  final VoidCallback onEditOperationTap;

  @override
  State<_OperationCard> createState() => _OperationCardState();
}

class _OperationCardState extends State<_OperationCard> {
  final operationController = GetIt.instance<OperationController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          decoration: const BoxDecoration(
            color: Color(0xff1C1B1B),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, right: 20, left: 12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xffE9F7F2),
                    // : const Color(0xffF7E9E9),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ImageHelper.getSvg(widget.icon),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Text(
                        widget.operationName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        ImageHelper.getSvg(SvgNames.calendarIcon,
                            color: Colors.grey),
                        const SizedBox(width: 5),
                        Text(
                          widget.date,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: widget.onEditOperationTap,
                  child: Text(
                    'Edit',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _TransactionsButtons extends StatelessWidget {
  const _TransactionsButtons(
      {super.key, required this.onOutcomeTap, required this.onIncomeTap});

  final VoidCallback onOutcomeTap;
  final VoidCallback onIncomeTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onIncomeTap,
            child: Container(
              width: 131,
              height: 135,
              decoration: const BoxDecoration(
                color: Color(0xff95CDC6),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Income',
                        style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 10),
                    Container(
                      width: 38,
                      height: 38,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ImageHelper.getSvg(SvgNames.outcome),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: InkWell(
            onTap: onOutcomeTap,
            child: Container(
              height: 135,
              width: 131,
              decoration: const BoxDecoration(
                color: Color(0xffFF5F76),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Outcome',
                        style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 10),
                    Container(
                      width: 38,
                      height: 38,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: ImageHelper.getSvg(SvgNames.income),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BalanceCard extends StatelessWidget {
  _BalanceCard(
      {super.key,
      required this.balance,
      required this.onEditBalanceTap,
      required this.onStatisticsTap});

  final double balance;
  final VoidCallback onEditBalanceTap;
  final VoidCallback onStatisticsTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
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
              'Monthly budget',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white54),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Text(
                    '\$${balance.toStringAsFixed(2)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: onEditBalanceTap,
                  child: Text(
                    'Edit',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white54),
            InkWell(
              onTap: onStatisticsTap,
              child: Container(
                height: 58,
                decoration: const BoxDecoration(
                  color: Color(0xff464645),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Generate statistic’s',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white),
                      ),
                      const Spacer(),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          color: Color(0xff1C1C1C),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ImageHelper.getSvg(SvgNames.statisticsIcon),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
