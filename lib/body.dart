import 'package:flutter/material.dart';
import 'package:study_flutter/screen/homeScreen.dart';
import 'package:study_flutter/screen/searchScreen.dart';

class InstaBody extends StatelessWidget {

  final int index;
  const InstaBody({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    if(index == 0) {
      return HomeScreen();
    }

    return SearchScreen();
  }
}
