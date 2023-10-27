import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).tab2),
        ),
        body: Center(
          child: Text(S.of(context).tab2, style: const TextStyle(fontSize: 50)),
        ),
      );
}
