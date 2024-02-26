import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import '../../helpers/image/image_helper.dart';
import '../../models/card_model.dart';
import '../../services/data_base.dart';
import '../../services/event_bus.dart';
import '../../services/navigation/route_names.dart';

class EditCardView extends StatefulWidget {
  EditCardView({super.key});

  @override
  State<EditCardView> createState() => _EditCardViewState();
}

class _EditCardViewState extends State<EditCardView> {
  final dataBase = GetIt.instance<DataBase>();
  final eventBus = GetIt.instance<EventBus>();

  TextEditingController cardBankController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController cardNameController = TextEditingController();

  TextEditingController cardBalanceController = TextEditingController();

  TextEditingController cardCvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dataBase.init();
  }

  void _clearCardFields() {
    cardBalanceController.clear();
    cardNumberController.clear();
    cardBankController.clear();
    cardNameController.clear();
    cardCvvController.clear();
  }

  void _refresh() async {
    await dataBase.init();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final card = ModalRoute.of(context)!.settings.arguments as BankCard;
    cardBankController.text = card.bank;
    cardNumberController.text = card.number.toString();
    cardNameController.text = card.name;
    cardBalanceController.text = card.balance;
    cardCvvController.text = card.cvv.toString();
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                        Text('Add card',
                            style: Theme.of(context).textTheme.labelLarge),
                        const SizedBox(width: 50),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text('Enter bank name',
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5.0,
                            offset: const Offset(
                              0.0,
                              5.0,
                            ),
                          ),
                        ],
                      ),

                      /// Enter card name
                      child: TextField(
                        controller: cardBankController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]')),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          hintText: '...',
                          filled: true,
                          fillColor: const Color(0xffefeff0),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ImageHelper.getSvg(SvgNames.cardIcon),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text('Enter card number',
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5.0,
                            offset: const Offset(
                              0.0,
                              5.0,
                            ),
                          ),
                        ],
                      ),

                      /// Enter card number
                      child: TextField(
                        //mask: "#### #### #### ####",
                        controller: cardNumberController,
                        //keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          LengthLimitingTextInputFormatter(16),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          hintText: '...',
                          filled: true,
                          fillColor: const Color(0xffefeff0),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ImageHelper.getSvg(SvgNames.cardIcon),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text('Enter your name',
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5.0,
                            offset: const Offset(
                              0.0,
                              5.0,
                            ),
                          ),
                        ],
                      ),

                      /// Enter your name
                      child: TextField(
                        controller: cardNameController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]')),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          hintText: '...',
                          filled: true,
                          fillColor: const Color(0xffefeff0),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ImageHelper.getSvg(SvgNames.cardIcon),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text('Enter summ',
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5.0,
                            offset: const Offset(
                              0.0,
                              5.0,
                            ),
                          ),
                        ],
                      ),

                      /// Enter summ
                      child: TextField(
                        controller: cardBalanceController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          LengthLimitingTextInputFormatter(9),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Color(0xffefeff0), width: 0.0),
                          ),
                          hintText: '...',
                          filled: true,
                          fillColor: const Color(0xffefeff0),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ImageHelper.getSvg(SvgNames.cardIcon),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text('Enter CVV/CVS code',
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(right: 250),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5.0,
                              offset: const Offset(
                                0.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),

                        /// Enter CVV/CVS code
                        child: TextField(
                          controller: cardCvvController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(3),
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffefeff0), width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffefeff0), width: 0.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffefeff0), width: 0.0),
                            ),
                            hintText: '...',
                            filled: true,
                            fillColor: const Color(0xffefeff0),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ImageHelper.getSvg(SvgNames.cardIcon),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 20,
                left: MediaQuery.of(context).size.width / 3.2,
                right: MediaQuery.of(context).size.width / 3.2,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  dataBase.addBankCard(BankCard(
                    balance: cardBalanceController.text,
                    number: int.parse(cardNumberController.text),
                    bank: cardBankController.text,
                    name: cardNameController.text,
                    cvv: int.parse(cardCvvController.text),
                    id: card.id,
                  ));
                  _clearCardFields();
                  _refresh();
                  await Navigator.of(context).pushNamed(RouteNames.homeMenu);
                  eventBus.addEvent(MyWallet());
                  setState(() {});
                },
                child: Text(
                  'Save',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
