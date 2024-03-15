import 'package:flutter/material.dart';

void main() => runApp(const chartScreen());

class chartScreen extends StatelessWidget {
  const chartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
       
      ),
    );
  }
}