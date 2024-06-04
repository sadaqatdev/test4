import 'package:challenge/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddToDoPage extends StatelessWidget {
  const AddToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr(LocaleKeys.add_todo))),
      body: const Center(child: Placeholder()),
    );
  }
}
