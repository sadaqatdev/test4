import 'package:challenge/generated/locale_keys.g.dart';
import 'package:challenge/ui/add_todo/add_todo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr(LocaleKeys.todos))),
      body: const SafeArea(
        child: Placeholder(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const AddToDoPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
