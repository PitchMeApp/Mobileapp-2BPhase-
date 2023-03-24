import 'package:flutter/material.dart';

class shareScreen extends StatefulWidget {
  const shareScreen({super.key});

  @override
  State<shareScreen> createState() => _shareScreenState();
}

class _shareScreenState extends State<shareScreen> {
  PageController _controller = PageController();

  int pageViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
    );
  }
}
