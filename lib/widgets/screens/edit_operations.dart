import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../helpers/image/image_helper.dart';
import '../../logic/operations_controller.dart';
import '../../services/data_base.dart';
import '../../services/navigation/route_names.dart';

class EditOperationsView extends StatefulWidget {
  const EditOperationsView({super.key});

  @override
  State<EditOperationsView> createState() => _EditOperationsViewState();
}

class _EditOperationsViewState extends State<EditOperationsView> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await Navigator.of(context)
                            .pushNamed(RouteNames.homeMenu);
                        setState(() {});
                      },
                      icon: ImageHelper.getSvg(SvgNames.backIcon),
                    ),
                    Text('Edit operations',
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(width: 50),
                  ],
                ),
                const SizedBox(height: 20),
                for (final operation in dataBase.getAllOperations())
                  _OperationCard(
                    amount: operation.amount.toString(),
                    icon: operation.icon,
                    operationName: operation.name,
                    date: operation.date,
                    onDeleteOperationTap: () {
                      setState(() {
                        dataBase.deleteOperation(operation.id);
                      });
                    },
                  ),
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
      required this.onDeleteOperationTap});

  final String icon;
  final String operationName;
  final String date;
  final String amount;
  final VoidCallback onDeleteOperationTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
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
                Row(
                  children: [
                    Text('$amount\$'),
                    IconButton(
                        onPressed: onDeleteOperationTap,
                        icon: Icon(Icons.delete))
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
