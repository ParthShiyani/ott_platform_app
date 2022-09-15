import 'package:flutter/material.dart';
import 'package:ott_plateform_app/screens/details_app_page.dart';
import 'package:ott_plateform_app/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'details_page': (context) => DetailWebPage(),
      },
    ),
  );
}
