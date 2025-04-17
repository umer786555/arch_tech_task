import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieView extends StatefulWidget {
  const LottieView(
      {super.key, required this.lottieToShow, required this.message});
  final String lottieToShow;
  final String message;

  @override
  State<LottieView> createState() => _LottieViewState();
}

class _LottieViewState extends State<LottieView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset(widget.lottieToShow),
      ),
    );
  }
}
