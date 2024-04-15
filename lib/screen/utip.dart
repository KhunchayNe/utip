import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/providers/tip_calulator_model.dart';
import 'bill_amount.dart';

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final model = Provider.of<TipCalulatorModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: theme.colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Total Per Person',
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    '\$${model.totalPerPerson.toStringAsFixed(2)}',
                    style: theme.textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2.0,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    BillAmount(
                        billAmont: model.billTotal.toString(),
                        onChange: (value) {
                          model.updateBillTotal(
                              value.isNotEmpty ? double.parse(value) : 0);
                        }),
                    personCount(theme, model),
                    tip(theme, model),
                    const SizedBox(height: 30.0),
                    tipScroll(theme, model.precenTip, model)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tipScroll(
          ThemeData theme, double percenTip, TipCalulatorModel model) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Slider(
              min: 0,
              max: 0.5,
              divisions: 5,
              label: '${(model.precenTip * 100).round()}%',
              value: model.precenTip,
              onChanged: (double value) {
                model.updatePercenTip(value);
              }),
          Text(
            '${model.precenTip.round()}%',
            style: theme.textTheme.titleMedium,
          ),
        ],
      );

  Widget tip(ThemeData theme, TipCalulatorModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tip',
          style: theme.textTheme.titleMedium,
        ),
        Text(
          '\$${model.totalTip().toStringAsFixed(2)}',
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }

  Widget personCount(ThemeData theme, TipCalulatorModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Split',
          style: theme.textTheme.titleMedium,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (model.personCount > 1) {
                  model.updatePersonCount(model.personCount - 1);
                }
              },
              icon: Icon(color: theme.colorScheme.primary, Icons.remove),
            ),
            Text(
              model.personCount.toString(),
              style: theme.textTheme.titleMedium,
            ),
            IconButton(
              onPressed: () => {model.updatePersonCount(model.personCount + 1)},
              icon: Icon(color: theme.colorScheme.primary, Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
