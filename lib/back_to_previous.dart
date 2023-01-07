import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class BackToPrevious extends StatelessWidget {
  final VoidCallback backPrevious;
  const BackToPrevious({super.key, required this.backPrevious});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: backPrevious,
      child: Text('Back'),
    );
  }
}
