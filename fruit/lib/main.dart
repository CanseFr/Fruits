import 'package:flutter/material.dart';
import 'package:fruit/common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Fruit Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> listImage = [
    Image.asset(
      'images/ananas.png',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    ),
    Image.asset(
      'images/pomme.png',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    ),
    Image.asset(
      'images/poire.png',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    ),
  ];

  int _counter = 0;
  List<int> _fruit = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      _fruit.add(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _fruit.length,
          itemBuilder: (context, index) {
            final int currentFruit = _fruit[index];
            return ListTile(
              tileColor: getColorOddOrNot(currentFruit),
              title: Text(
                currentFruit.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              leading: listImage[getCounterType(currentFruit)],
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Alert Fruit'),
                      backgroundColor: getColorOddOrNot(currentFruit),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('$currentFruit : Nombre ' +
                                getCounterTypeStr(currentFruit)),
                            listImage[getCounterType(currentFruit)],
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Fermer'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _fruit.removeAt(index);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Ajouter fruit',
        child: const Icon(Icons.add),
      ),
    );
  }
}
