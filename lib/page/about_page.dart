import 'package:flutter/material.dart';
import 'package:flutter_practice/page/provider.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    int itemCount = Provider.of<Manage>(context).counter;
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
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
                 Provider.of<Manage>(context, listen: false).increaseCounter();
                },
                child: const Text('Add')),
            ElevatedButton(
                onPressed: () {
               Provider.of<Manage>(context, listen: false).decreaseCounter();
                },
                child: const Text('Delete')),
          ],
        )
      ]),
    );
  }
}
