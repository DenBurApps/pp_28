import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../helpers/constants.dart';
import '../../helpers/image/image_helper.dart';
import '../../models/operation_model.dart';
import '../../services/data_base.dart';
import '../../services/navigation/route_names.dart';
import '../../storage/storage_service.dart';

class IncomeView extends StatefulWidget {
  IncomeView({super.key});

  @override
  State<IncomeView> createState() => _IncomeViewState();
}

class _IncomeViewState extends State<IncomeView> {
  final dataBase = GetIt.instance<DataBase>();
  final _storageService = GetIt.instance<StorageService>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _sumController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();
  late int income = _storageService.getInt(StorageKeys.income) ?? 0;

  Future<void> _saveIncomeAction(int index) async {
    if (_nameController.text.isNotEmpty &&
        _sumController.text.isNotEmpty &&
        _dateController.text.isNotEmpty) {
      dataBase.addOperation(Operation(
        symbol: '+',
        hexString: 'E9F7F2',
        amount: int.parse(_sumController.text),
        name: _nameController.text,
        date: _dateController.text,
        icon: categoryIcons[index],
        id: const Uuid().v4(),
      ));
      income += int.parse(_sumController.text);
      _storageService.setInt(StorageKeys.income, income!);
      await Navigator.of(context).pushNamed(RouteNames.homeMenu);
      setState(() {});
    } else {
      return;
    }
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
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: ImageHelper.getSvg(SvgNames.backIcon),
                    ),
                    Text('Income', style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(width: 50),
                  ],
                ),
                const SizedBox(height: 20),
                _CategoryCard(
                  onTap_1: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(0);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_2: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(1);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_3: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(2);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_4: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(3);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  icon_1: categoryIcons[0],
                  icon_2: categoryIcons[1],
                  icon_3: categoryIcons[2],
                  icon_4: categoryIcons[3],
                ),
                const SizedBox(height: 10),
                _CategoryCard(
                  onTap_1: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(4);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_2: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(5);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_3: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(6);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_4: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(7);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  icon_1: categoryIcons[4],
                  icon_2: categoryIcons[5],
                  icon_3: categoryIcons[6],
                  icon_4: categoryIcons[7],
                ),
                const SizedBox(height: 10),
                _CategoryCard(
                  onTap_1: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(8);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_2: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(9);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_3: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(10);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_4: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(11);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  icon_1: categoryIcons[8],
                  icon_2: categoryIcons[9],
                  icon_3: categoryIcons[10],
                  icon_4: categoryIcons[11],
                ),
                const SizedBox(height: 10),
                _CategoryCard(
                  onTap_1: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(12);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_2: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(13);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_3: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(14);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_4: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(15);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  icon_1: categoryIcons[12],
                  icon_2: categoryIcons[13],
                  icon_3: categoryIcons[14],
                  icon_4: categoryIcons[15],
                ),
                const SizedBox(height: 10),
                _CategoryCard(
                  onTap_1: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(16);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_2: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(17);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_3: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(18);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_4: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(19);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  icon_1: categoryIcons[16],
                  icon_2: categoryIcons[17],
                  icon_3: categoryIcons[18],
                  icon_4: categoryIcons[19],
                ),
                const SizedBox(height: 10),
                _CategoryCard(
                  onTap_1: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(20);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_2: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(21);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_3: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(22);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_4: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(23);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  icon_1: categoryIcons[20],
                  icon_2: categoryIcons[21],
                  icon_3: categoryIcons[22],
                  icon_4: categoryIcons[23],
                ),
                const SizedBox(height: 10),
                _CategoryCard(
                  onTap_1: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(24);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_2: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(25);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_3: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(26);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  onTap_4: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return _IncomeBottomSheet(
                          onSaveTap: () {
                            _saveIncomeAction(27);
                          },
                          nameController: _nameController,
                          sumController: _sumController,
                          dateController: _dateController,
                        );
                      },
                    );
                  },
                  icon_1: categoryIcons[24],
                  icon_2: categoryIcons[25],
                  icon_3: categoryIcons[26],
                  icon_4: categoryIcons[27],
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

class _IncomeBottomSheet extends StatefulWidget {
  const _IncomeBottomSheet(
      {super.key,
      required this.nameController,
      required this.onSaveTap,
      required this.sumController,
      required this.dateController});

  final TextEditingController nameController;
  final TextEditingController sumController;
  final TextEditingController dateController;
  final VoidCallback onSaveTap;

  @override
  State<_IncomeBottomSheet> createState() => _IncomeBottomSheetState();
}

class _IncomeBottomSheetState extends State<_IncomeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 460,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 30),
                    const Spacer(),
                    const Text('Income add'),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close_rounded))
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Enter name',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ],
                  controller: widget.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Enter sum',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(9),
                  ],
                  controller: widget.sumController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Select date',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: widget.dateController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ImageHelper.getSvg(SvgNames.calendarIcon_2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate);
                      setState(() {
                        widget.dateController.text = formattedDate;
                      });
                    } else {}
                  },
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<TextEditingValue>(
                    valueListenable: widget.dateController,
                    builder: (context, value, child) {
                      return ElevatedButton(
                        onPressed: widget.onSaveTap,
                        child: Text('Save',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white)),
                      );
                    }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    super.key,
    required this.icon_1,
    required this.icon_2,
    required this.icon_3,
    required this.icon_4,
    required this.onTap_1,
    required this.onTap_2,
    required this.onTap_3,
    required this.onTap_4,
  });

  final String icon_1;
  final String icon_2;
  final String icon_3;
  final String icon_4;
  final VoidCallback onTap_1;
  final VoidCallback onTap_2;
  final VoidCallback onTap_3;
  final VoidCallback onTap_4;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      decoration: const BoxDecoration(
        color: Color(0xffE9F7F2),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: onTap_1,
            child: Container(
              width: 47,
              height: 47,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ImageHelper.getSvg(icon_1),
              ),
            ),
          ),
          InkWell(
            onTap: onTap_2,
            child: Container(
              width: 47,
              height: 47,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ImageHelper.getSvg(icon_2),
              ),
            ),
          ),
          InkWell(
            onTap: onTap_3,
            child: Container(
              width: 47,
              height: 47,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ImageHelper.getSvg(icon_3),
              ),
            ),
          ),
          InkWell(
            onTap: onTap_4,
            child: Container(
              width: 47,
              height: 47,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ImageHelper.getSvg(icon_4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
