import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../helpers/image/image_helper.dart';
import '../../logic/operations_controller.dart';
import '../../services/data_base.dart';
import '../../services/navigation/route_names.dart';

class MyWalletView extends StatefulWidget {
  const MyWalletView({super.key});

  @override
  State<MyWalletView> createState() => _MyWalletViewState();
}

class _MyWalletViewState extends State<MyWalletView> {
  final dataBase = GetIt.instance<DataBase>();
  final operationController = GetIt.instance<OperationController>();
  int _cardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text('My wallet’s',
                          style: Theme.of(context).textTheme.labelLarge),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              (dataBase.bankCardsBox.isEmpty)
                  ? Column(
                      children: [
                        Text('No cards available',
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(height: 15),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              await Navigator.of(context)
                                  .pushNamed(RouteNames.addCard);
                              setState(() {});
                            },
                            child: Container(
                              width: 325,
                              height: 196,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: ImageHelper.getImage(
                                          ImageNames.dottedContainer)
                                      .image,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, _) {
                            _cardIndex = index;
                          }),
                      items: [
                        for (final card in dataBase.getAllBankCards())
                          _BankCard(
                            name: card.name,
                            cardNumber: card.number,
                            bankName: card.bank,
                            cvvNumber: card.cvv,
                            onHideTap: () {},
                            isFrontSide: true,
                            onShowTap: () {},
                          ),
                      ],
                    ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          await Navigator.of(context)
                              .pushNamed(RouteNames.addCard);
                          setState(() {});
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Color(0xff86B7B0),
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ImageHelper.getSvg(SvgNames.addCardIcon),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Add card',
                          style: Theme.of(context).textTheme.bodySmall)
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            final card = dataBase.getAllBankCards()[_cardIndex];
                            Navigator.of(context).pushNamed(
                              RouteNames.editCard,
                              arguments: card,
                            );
                          });
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Color(0xff78BBF9),
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ImageHelper.getSvg(SvgNames.editCardIcon),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Edit card',
                          style: Theme.of(context).textTheme.bodySmall)
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            final card = dataBase.getAllBankCards()[_cardIndex];
                            dataBase.deleteBankCard(card.id);
                          });
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Color(0xffFF5F76),
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ImageHelper.getSvg(SvgNames.deleteCardIcon),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Delete card',
                          style: Theme.of(context).textTheme.bodySmall)
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text('All cards',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 10),
                    for (final card in dataBase.getAllBankCards())
                      _CardChoiceButton(
                        bankName: card.bank,
                        cardNumber: card.number,
                        amount: card.balance,
                      ),
                    const SizedBox(height: 110),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardChoiceButton extends StatelessWidget {
  const _CardChoiceButton(
      {super.key,
      required this.bankName,
      required this.cardNumber,
      required this.amount});

  final String bankName;
  final int cardNumber;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                child: ImageHelper.getSvg(SvgNames.cardIcon),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: Text(
                    bankName,
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
                      '$cardNumber',
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
            Text('$amount\$'),
          ],
        ),
      ),
    );
  }
}

class _BankCard extends StatefulWidget {
  const _BankCard(
      {super.key,
      required this.onHideTap,
      required this.isFrontSide,
      required this.name,
      required this.cardNumber,
      required this.onShowTap,
      required this.bankName,
      required this.cvvNumber});

  final VoidCallback onShowTap;
  final VoidCallback onHideTap;
  final bool isFrontSide;
  final String name;
  final int cardNumber;
  final String bankName;
  final int cvvNumber;

  @override
  State<_BankCard> createState() => _BankCardState();
}

class _BankCardState extends State<_BankCard> {
  var _isFrontSide = true;

  @override
  Widget build(BuildContext context) {
    return _isFrontSide
        ? Center(
            child: Container(
              width: 325,
              height: 196,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(23),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1C1B1B),
                    Color(0xff4F4F4F),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        widget.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        '${widget.cardNumber}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isFrontSide = false;
                        });
                      },
                      child: Text(
                        'Show data',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: Container(
              width: 325,
              height: 196,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(23),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1C1B1B),
                    Color(0xff4F4F4F),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(
                              '${widget.cardNumber}',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            const Spacer(),
                            ImageHelper.getSvg(SvgNames.copyIcon),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 25,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(
                                  '${widget.cvvNumber}',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                const Spacer(),
                                ImageHelper.getSvg(SvgNames.copyIcon),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'This is CVC2/CVV2-code.',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          widget.bankName,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isFrontSide = true;
                            });
                          },
                          child: Text(
                            'Hide',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
  }
}
