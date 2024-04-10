import 'package:flutter/material.dart';

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;

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
                    '\$23.89',
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
              height: 250,
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
                    TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.attach_money),
                          labelText: 'Bill Amount'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        print(value);
                      },
                    ),

                    //Split Bull area
                    Row(
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
                              icon: Icon(
                                  color: theme.colorScheme.primary,
                                  Icons.remove),
                            ),
                            Text(
                              '$_personCount',
                              style: theme.textTheme.titleMedium,
                            ),
                            IconButton(
                              onPressed: () => {increment()},
                              icon: Icon(
                                  color: theme.colorScheme.primary, Icons.add),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
