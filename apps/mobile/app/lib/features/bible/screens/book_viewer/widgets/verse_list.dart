import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/shared.dart';

class VerseList extends StatelessWidget {
  const VerseList({super.key});

  @override
  Widget build(BuildContext context) {
    BibleService bibleService =
        Provider.of<BibleService>(context, listen: false);

    return const Placeholder();
  }
}
