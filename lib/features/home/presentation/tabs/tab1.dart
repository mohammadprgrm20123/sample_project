

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(

      appBar: AppBar(title: Text('Tab 1'),),

    body: const Center(child: Text('Tab1',style: TextStyle(fontSize: 50)),),
    );



}