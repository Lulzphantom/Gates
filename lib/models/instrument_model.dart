import 'package:flutter/material.dart';

class Instrument {
  final String title;
  final String description;
  final List<int> requiredIndex;
  final Widget intrumentWidget;

  Instrument(this.title, this.description, this.requiredIndex, this.intrumentWidget);  
}