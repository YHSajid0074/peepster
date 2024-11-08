import 'package:flutter/material.dart';
import 'package:peepster/components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer:const MyDrawer(),
      appBar:AppBar(
        title: const Text('H O M E'),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.primary,

        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary, // Changes drawer icon color based on theme
        ),
      ),
    );
  }
}
