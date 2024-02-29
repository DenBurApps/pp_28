import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_28/themes/custom_colors.dart';

import '../../helpers/color_helper.dart';
import '../../helpers/image/image_helper.dart';
import '../../services/data_base.dart';

class StatisticsView extends StatelessWidget {
  StatisticsView({super.key});
  final dataBase = GetIt.instance<DataBase>();

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
                    Text(
                      'Statistics',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                Center(
                  child: Text(
                    'Monthly budget',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.black54),
                  ),
                ),
                SizedBox(
                  child: _Chart(),
                  width: double.infinity,
                  height: 200,
                ),
                const SizedBox(height: 20),
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
      required this.color,
      required this.symbol});

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

class _Chart extends StatelessWidget {
  const _Chart();

  @override
  Widget build(BuildContext context) {
    final isNegative = true;
    // final values = chart.timestamps.reversed.toList();
    // final sorted = List.from(chart.timestamps)
    //   ..sort((a, b) {
    //     final firstPrice = double.parse(a.price);
    //     final secondPrice = double.parse(b.price);
    //     return firstPrice.compareTo(secondPrice);
    //   });

    // final maxPrice = double.parse(sorted.last.price);
    // final minY = double.parse(sorted.first.price);
    final maxPrice = 100;
    final minY = 0;
    return Container(
      height: 239,
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor:
                  Theme.of(context).colorScheme.surface.withOpacity(0.26),
              getTooltipItems: (touchedSpots) => touchedSpots
                  .map(
                    (e) => LineTooltipItem(
                      '${e.y.toStringAsFixed(2)}\$',
                      Theme.of(context).textTheme.displaySmall!,
                    ),
                  )
                  .toList(),
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 40,
                showTitles: true,
                getTitlesWidget: (value, meta) => Text(
                  meta.formattedValue,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ),
            bottomTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
          ),
          borderData: FlBorderData(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
          ),
          gridData: FlGridData(
            checkToShowHorizontalLine: (value) => true,
            checkToShowVerticalLine: (value) => true,
            getDrawingHorizontalLine: (value) => FlLine(
              strokeWidth: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            getDrawingVerticalLine: (value) => FlLine(
              strokeWidth: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              barWidth: 2,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context)
                        .extension<CustomColors>()!
                        .red
                        .withOpacity(0.3),
                    // : Theme.of(context)
                    //     .extension<CustomColors>()!
                    //     .green
                    //     .withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
              spots: [
                FlSpot(0, 20),
                FlSpot(1, 30),
                FlSpot(2, 90),
              ],
              dotData: const FlDotData(show: false),
              color: isNegative
                  ? Theme.of(context).extension<CustomColors>()!.red
                  : Theme.of(context).extension<CustomColors>()!.green,
            ),
          ],
          minY: 0,
          minX: 0,
          maxX: 20,
          maxY: 100,
        ),
      ),
    );
  }
}
