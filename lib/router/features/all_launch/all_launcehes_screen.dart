import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AllLauncehesScreen extends StatelessWidget {
  const AllLauncehesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('All Launches'),
      ),
      body: const Center(
        child: Text('All Launches Screen', 
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}