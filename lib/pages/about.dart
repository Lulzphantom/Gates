import 'package:flutter/material.dart';
import 'package:gates/styles/gates_theme.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secundaryBackground,
        title: Text('About Gates for X-Plane'),
      ),
      backgroundColor: principalBackground,
    );
  }
}