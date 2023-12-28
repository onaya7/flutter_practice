import 'package:flutter/material.dart';
import 'package:flutter_practice/page/home_page.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final ItemCounter data =
        ModalRoute.of(context)!.settings.arguments as ItemCounter;
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 300.0,
          child: Text(
            '${data.count}',
            style: const TextStyle(fontSize: 30.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    data.count = (data.count ?? 0) + 1;
                  });
                },
                child: const Text('Add')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    data.count = (data.count ?? 0) -1;
                  });
                },
                child: const Text('Delete')),
          ],
        )
      ]),
    );
  }
}
