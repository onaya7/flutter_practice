import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/about',
            arguments: ItemCounter(count: itemCount)),
        child: const Icon(Icons.forward),
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 300.0,
          child: Text(
            '$itemCount',
            style: const TextStyle(fontSize: 30.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    itemCount++;
                  });
                },
                child: const Text('Add')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    itemCount--;
                  });
                },
                child: const Text('Delete')),
          ],
        )
      ]),
    );
  }
}

class ItemCounter {
  int? count;
  ItemCounter({this.count});
}
