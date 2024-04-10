import 'package:flutter/material.dart';
import 'bill_amount.dart';

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;

  double _percentTip = 0;
  double _billTotal = 0.0;

  double totalPerPerson() {
    print("$_billTotal $_percentTip $_personCount");
    return (((_billTotal * _percentTip) + _billTotal) / _personCount);
  }

  double totalTip() {
    return (_billTotal * _percentTip);
  }

  void increment() {
    setState(() {
      _personCount++;
    });
  }

  void decerment() {
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var amount = totalPerPerson();
    var tipTotal = totalTip();
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
                    '\$${amount.toStringAsFixed(2)}',
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
                        billAmont: _billTotal.toString(),
                        onChange: (value) {
                          setState(() {
                            _billTotal = double.parse(value);
                          });
                        }),
                    personCount(theme),
                    tip(theme, tipTotal),
                    const SizedBox(height: 30.0),
                    tipScroll(theme)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tipScroll(ThemeData theme) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Slider(
              min: 0,
              max: 0.5,
              divisions: 5,
              label: '${(_percentTip * 100).round()}%',
              value: _percentTip,
              onChanged: (value) {
                setState(() {
                  _percentTip = value;
                });
              }),
          Text(
            '${(_percentTip * 100).round()}%',
            style: theme.textTheme.titleMedium,
          ),
        ],
      );

  Widget tip(ThemeData theme, double tip) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tip',
          style: theme.textTheme.titleMedium,
        ),
        Text(
          '\$${tip.toStringAsFixed(2)}',
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }

  Widget personCount(ThemeData theme) {
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
              onPressed: () => {decerment()},
              icon: Icon(color: theme.colorScheme.primary, Icons.remove),
            ),
            Text(
              '$_personCount',
              style: theme.textTheme.titleMedium,
            ),
            IconButton(
              onPressed: () => {increment()},
              icon: Icon(color: theme.colorScheme.primary, Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
