import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.grey[500],
  ),
  home: Home(),
));
