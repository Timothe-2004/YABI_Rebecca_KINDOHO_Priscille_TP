
import 'package:flutter/material.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candidate',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),

      home: CandidatesPage(),
    );
  }
}
